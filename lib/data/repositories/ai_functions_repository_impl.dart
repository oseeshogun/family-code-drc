import 'package:family_code/core/utils/lexical_search.dart';
import 'package:family_code/data/repositories/article_repository_impl.dart';
import 'package:family_code/data/repositories/division_repository_impl.dart';
import 'package:family_code/domain/entities/article.dart';
import 'package:family_code/domain/entities/division.dart';
import 'package:family_code/domain/repositories/ai_functions_repository.dart';
import 'package:family_code/domain/repositories/article_repository.dart';
import 'package:family_code/domain/repositories/division_repository.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ai_functions_repository_impl.g.dart';

@Riverpod(keepAlive: true)
AiFunctionsRepository aiFunctionsRepository(Ref ref) {
  return AiFunctionsRepositoryImpl(ref.watch(divisionRepositoryProvider), ref.watch(articleRepositoryProvider));
}

class AiFunctionsRepositoryImpl with AiFunctionsRepository {
  final DivisionRepository _divisionRepository;
  final ArticleRepository _articleRepository;

  AiFunctionsRepositoryImpl(this._divisionRepository, this._articleRepository);

  @override
  Future<Map<String, dynamic>> getCodeStructure() async {
    final roots = await _divisionRepository.streamRoots().first;
    final tree = <Map<String, dynamic>>[];
    for (final root in roots) {
      tree.add(await _buildDivisionNode(root));
    }
    return {'divisions': tree};
  }

  Future<Map<String, dynamic>> _buildDivisionNode(DivisionEntity division) async {
    final children = await _divisionRepository.streamByParent(division.id).first;
    final childNodes = <Map<String, dynamic>>[];
    for (final child in children) {
      childNodes.add(await _buildDivisionNode(child));
    }
    return {
      'id': division.id,
      'type': division.type.name,
      'numero': division.numero,
      'intitule': division.intitule,
      if (childNodes.isNotEmpty) 'children': childNodes,
    };
  }

  @override
  Future<List<Map<String, dynamic>>> searchArticles({required List<String> keywords, int limit = 12}) async {
    final clampedLimit = limit.clamp(1, 12);
    final allArticles = await _articleRepository.streamAll().first;

    if (keywords.isEmpty) {
      return allArticles.take(clampedLimit).map(_toMap).toList();
    }

    final query = keywords.join(' ');
    final matches = allArticles.where((a) => matchesQuery('${a.contenu} ${a.slug}', query)).toList();
    return matches.take(clampedLimit).map(_toMap).toList();
  }

  @override
  Future<Map<String, dynamic>?> getArticleByNumero(String numero) async {
    final allArticles = await _articleRepository.streamAll().first;
    final normalized = numero.trim().toLowerCase();
    final article = allArticles.firstWhereOrNull((a) => a.numero.trim().toLowerCase() == normalized);
    return article == null ? null : _toMap(article);
  }

  Map<String, dynamic> _toMap(ArticleEntity a) => {'id': a.id, 'numero': a.numero, 'text': a.contenu};
}
