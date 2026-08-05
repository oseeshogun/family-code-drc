import 'package:family_code/presentation/widgets/article_widget.dart';
import 'package:family_code/domain/entities/division.dart';
import 'package:family_code/domain/providers/articles/article.dart';
import 'package:family_code/domain/providers/divisions/divisions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DivisionsListWidget extends StatelessWidget {
  final List<DivisionEntity> divisions;

  const DivisionsListWidget({super.key, required this.divisions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      itemCount: divisions.length,
      itemBuilder: (context, index) => DivisionExpansionTile(division: divisions[index]),
    );
  }
}

/// Recursive expansion tile: a `Division` can have both directly-attached
/// `Articles` and nested child `Divisions`, to an arbitrary depth (livre ->
/// titre -> chapitre -> section -> sous_section -> paragraphe -> subdivision).
class DivisionExpansionTile extends HookConsumerWidget {
  const DivisionExpansionTile({super.key, required this.division, this.indent = 0});

  final DivisionEntity division;
  final double indent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childDivisionsAsync = ref.watch(childDivisionsProvider(division.id));
    final articlesAsync = ref.watch(articlesByDivisionProvider(division.id));

    return Container(
      decoration:
          indent == 0
              ? null
              : const BoxDecoration(border: Border(left: BorderSide(color: Colors.grey, width: 3.0))),
      padding: indent == 0 ? EdgeInsets.zero : const EdgeInsets.only(bottom: 2.0),
      margin: indent == 0 ? const EdgeInsets.only(bottom: 12.0) : const EdgeInsets.symmetric(vertical: 2.0),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: indent == 0 ? 0 : 8.0),
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
        title: Text(
          '${division.type.libelle} ${division.numero}',
          style: TextStyle(fontWeight: indent == 0 ? FontWeight.bold : FontWeight.w500),
        ),
        subtitle: Text(division.intitule, maxLines: 2, overflow: TextOverflow.ellipsis),
        childrenPadding: EdgeInsets.fromLTRB(16.0, 0.0, indent == 0 ? 16.0 : 8.0, indent == 0 ? 16.0 : 8.0),
        children: [
          articlesAsync.when(
            data: (articles) {
              if (articles.isEmpty) return const SizedBox.shrink();
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Articles:', style: const TextStyle(fontWeight: FontWeight.w500)),
                    ),
                  ),
                  ...articles.map(
                    (article) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ArticleWidget(id: article.id, maxLines: 3),
                    ),
                  ),
                ],
              );
            },
            loading:
                () => const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2.0)),
                  ),
                ),
            error:
                (error, _) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Erreur lors du chargement des articles: ${error.toString()}',
                    style: TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                ),
          ),
          childDivisionsAsync.when(
            data: (children) {
              if (children.isEmpty) return const SizedBox.shrink();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children.map((child) => DivisionExpansionTile(division: child, indent: indent + 1)).toList(),
              );
            },
            loading:
                () => const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2.0)),
                  ),
                ),
            error:
                (error, _) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Erreur lors du chargement des divisions: ${error.toString()}',
                    style: TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
