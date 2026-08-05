import 'package:family_code/presentation/widgets/article_widget.dart';
import 'package:family_code/domain/entities/article.dart';
import 'package:family_code/domain/providers/home/search.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticleSearchDelegate extends SearchDelegate<ArticleEntity?> {
  ArticleSearchDelegate()
    : super(
        searchFieldLabel: 'Rechercher un article...',
        searchFieldStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
      );

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) => _buildBody(context);

  @override
  Widget buildSuggestions(BuildContext context) => _buildBody(context);

  Widget _buildBody(BuildContext context) {
    if (query.isEmpty) {
      return _buildEmptySearchPrompt(context);
    }

    return Consumer(
      builder: (context, ref, child) {
        final articlesAsync = ref.watch(searchProvider(query));

        return articlesAsync.when(
          data: (articles) {
            if (articles.isEmpty) {
              return _buildEmptySearchPrompt(context);
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ArticleWidget(id: article.id, maxLines: 3);
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error:
              (error, stackTrace) => Center(
                child: Text(
                  'Erreur lors de la recherche: $error',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
        );
      },
    );
  }

  Widget _buildEmptySearchPrompt(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            'Rechercher un article...',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          const Text(
            'Astuces: Tapez 18,23,14 pour avoir les articles 18, 23 et 14',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
