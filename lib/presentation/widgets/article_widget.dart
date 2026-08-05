import 'package:family_code/domain/providers/articles/article.dart';
import 'package:family_code/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticleWidget extends HookConsumerWidget {
  final int id;
  final int? maxLines;
  final int? maxLength;

  const ArticleWidget({super.key, required this.id, this.maxLines, this.maxLength = 150});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleAsync = ref.watch(articleProvider(id));

    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
        side: BorderSide(color: Theme.of(context).dividerColor.withAlpha((0.3 * 255).toInt())),
      ),
      color: Colors.grey.withValues(alpha: 0.1),
      child: articleAsync.when(
        data: (article) {
          final displayText =
              maxLength != null && article.contenu.length > maxLength!
                  ? '${article.contenu.substring(0, maxLength)}...'
                  : article.contenu;
          final isAbroge = article.statut == 'abroge';

          return InkWell(
            borderRadius: BorderRadius.circular(8.0),
            onTap: () => ArticleRoute(article.id).push(context),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: RichText(
                          maxLines: maxLines,
                          overflow: maxLines != null ? TextOverflow.ellipsis : TextOverflow.clip,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Article ${article.numero}\n',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).textTheme.bodyLarge?.color,
                                ),
                              ),
                              TextSpan(
                                text: displayText,
                                style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (isAbroge)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Chip(
                            label: const Text('Abrogé', style: TextStyle(fontSize: 11)),
                            visualDensity: VisualDensity.compact,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        loading:
            () => const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2.0))),
            ),
        error:
            (error, stackTrace) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Erreur lors du chargement de l\'article: ${error.toString()}',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
      ),
    );
  }
}
