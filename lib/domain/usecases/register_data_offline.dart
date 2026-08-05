import 'package:family_code/core/domain/usecases/usecase.dart';
import 'package:family_code/data/repositories/article_repository_impl.dart';
import 'package:family_code/data/repositories/division_repository_impl.dart';
import 'package:family_code/domain/entities/article.dart';
import 'package:family_code/domain/entities/division_type.dart';
import 'package:family_code/domain/repositories/article_repository.dart';
import 'package:family_code/domain/repositories/division_repository.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaml/yaml.dart';

part 'register_data_offline.g.dart';

@Riverpod(keepAlive: true)
RegisterDataOnOfflineUseCase registerDataOffline(Ref ref) {
  final DivisionRepository divisionRepository = ref.watch(divisionRepositoryProvider);
  final ArticleRepository articleRepository = ref.watch(articleRepositoryProvider);

  return RegisterDataOnOfflineUseCase(divisionRepository, articleRepository);
}

/// Imports the DRC Family Code dataset (`assets/data/manifest.yaml` +
/// `livre_1.yaml`…`livre_5.yaml`) into the local database, recursively
/// walking each division's nested `divisions`/`articles` lists.
class RegisterDataOnOfflineUseCase extends UseCase<void> {
  final DivisionRepository _divisionRepository;
  final ArticleRepository _articleRepository;

  RegisterDataOnOfflineUseCase(this._divisionRepository, this._articleRepository);

  @override
  Future<void> execute() async {
    final manifestContent = await rootBundle.loadString('assets/data/manifest.yaml');
    final manifest = loadYaml(manifestContent) as YamlMap;
    final livres = manifest['livres'] as YamlList;

    for (final livreRef in livres) {
      final fileName = (livreRef as YamlMap)['fichier'].toString();
      await _importLivre('assets/data/$fileName');
    }
  }

  Future<void> _importLivre(String assetPath) async {
    final content = await rootBundle.loadString(assetPath);
    final data = loadYaml(content) as YamlMap;

    final livre = data['livre'] as YamlMap;
    final livreDivision = await _divisionRepository.insert(
      type: DivisionType.livre,
      numero: livre['numero'].toString(),
      intitule: livre['intitule'].toString(),
      ordre: livre['ordre'] as int,
      chemin: livre['chemin'].toString(),
      parentId: null,
    );

    final divisions = data['divisions'] as YamlList? ?? YamlList();
    for (final division in divisions) {
      await _importDivision(division as YamlMap, livreDivision.id);
    }
  }

  Future<void> _importDivision(YamlMap division, int parentId) async {
    final divisionEntity = await _divisionRepository.insert(
      type: DivisionType.fromYaml(division['type'].toString()),
      numero: division['numero'].toString(),
      intitule: division['intitule'].toString(),
      ordre: division['ordre'] as int,
      chemin: division['chemin'].toString(),
      parentId: parentId,
    );

    final rawArticles = division['articles'] as YamlList? ?? YamlList();
    if (rawArticles.isNotEmpty) {
      final articles = rawArticles.map((article) => _toArticleEntity(article as YamlMap, divisionEntity.id)).toList();
      await _articleRepository.insertAll(articles);
    }

    final rawDivisions = division['divisions'] as YamlList? ?? YamlList();
    for (final child in rawDivisions) {
      await _importDivision(child as YamlMap, divisionEntity.id);
    }
  }

  ArticleEntity _toArticleEntity(YamlMap article, int divisionId) {
    final version = article['version'] as YamlMap;
    final rawNumeroTri = article['numero_tri'];
    final numeroTri = rawNumeroTri is int ? rawNumeroTri.toDouble() : rawNumeroTri as double;
    final texteSource = version['texte_source'];

    return ArticleEntity(
      id: 0, // ignored on insert: assigned by the autoincrement primary key
      divisionId: divisionId,
      numero: article['numero'].toString(),
      numeroTri: numeroTri,
      ordre: article['ordre'] as int,
      statut: version['statut'].toString(),
      texteSource: texteSource == null ? null : texteSource.toString(),
      contenu: version['contenu'].toString(),
      slug: '', // computed from contenu at insert time
    );
  }
}
