import 'package:family_code/data/repositories/article_repository_impl.dart';
import 'package:family_code/domain/providers/articles/article.dart';
import 'package:family_code/core/router/routes.dart';
import 'package:family_code/domain/providers/home/read_disclaimer.dart';
import 'package:family_code/presentation/dialogs/disclaimer_dialog.dart';
import 'package:family_code/domain/providers/articles/article_of_the_day.dart';
import 'package:family_code/domain/providers/divisions/divisions.dart';
import 'package:family_code/presentation/widgets/article_of_the_day_card.dart';
import 'package:family_code/presentation/widgets/article_search_delegate.dart';
import 'package:family_code/presentation/widgets/divisions_empty_widget.dart';
import 'package:family_code/presentation/widgets/divisions_error_widget.dart';
import 'package:family_code/presentation/widgets/divisions_list_widget.dart';
import 'package:family_code/presentation/widgets/divisions_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasReadDisclaimer = ref.watch(readDisclaimerProvider).value;
    final divisionsAsync = ref.watch(divisionsProvider);
    final articleCountAsync = ref.watch(articleCountProvider);
    final articleOfTheDayAsync = ref.watch(articleOfTheDayProvider);
    final articleVisibilityAsync = ref.watch(articleOfDayVisibilityProvider);
    final favoriteArticlesAsync = ref.watch(favoriteArticlesProvider);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (hasReadDisclaimer is bool && !hasReadDisclaimer) {
          showDisclaimerDialog(context);
        }
      });
      return null;
    }, [hasReadDisclaimer]);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SvgPicture.asset('assets/svgs/logo-mark.svg'),
        ),
        title: const Text('Code de la Famille', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24.0)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => showSearch(context: context, delegate: ArticleSearchDelegate()),
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: () => InfoRoute().push(context), icon: const Icon(Icons.info_outline)),
        ],
      ),
      body: Column(
        children: [
          articleVisibilityAsync.when(
            data:
                (isVisible) =>
                    isVisible
                        ? articleOfTheDayAsync.when(
                          data:
                              (article) => ArticleOfTheDayCard(
                                article: article,
                                onClose: () {
                                  ref.read(articleOfDayVisibilityProvider.notifier).hideForToday();
                                },
                              ),
                          loading: () => const SizedBox(height: 150, child: Center(child: CircularProgressIndicator())),
                          error: (_, _) => const SizedBox(),
                        )
                        : const SizedBox(),
            loading: () => const SizedBox(),
            error: (_, _) => const SizedBox(),
          ),
          favoriteArticlesAsync.when(
            data: (favoriteArticles) {
              return Visibility(
                visible: favoriteArticles.isNotEmpty,
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: favoriteArticles.length,
                    itemBuilder: (context, index) {
                      final article = favoriteArticles[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: InkWell(
                          onTap: () => ArticleRoute(article.id).push(context),
                          child: Chip(
                            label: Text('⭐ Article ${article.numero}'),
                            deleteIcon: const Icon(Icons.close),
                            onDeleted: () {
                              ref.read(articleRepositoryProvider).toggleArticleToFavorite(article.id);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
            loading: () => const SizedBox.shrink(),
            error: (_, _) => const SizedBox.shrink(),
          ),
          Expanded(
            child: divisionsAsync.when(
              data: (divisions) {
                return articleCountAsync.when(
                  data: (articleCount) {
                    if (divisions.isEmpty || articleCount == 0) {
                      return const DivisionsEmptyWidget();
                    }
                    return DivisionsListWidget(divisions: divisions);
                  },
                  loading:
                      () => Visibility(
                        visible: divisions.isNotEmpty,
                        replacement: const DivisionsEmptyWidget(),
                        child: DivisionsListWidget(divisions: divisions),
                      ),
                  error:
                      (_, _) => Visibility(
                        visible: divisions.isNotEmpty,
                        replacement: const DivisionsEmptyWidget(),
                        child: DivisionsListWidget(divisions: divisions),
                      ),
                );
              },
              loading: () => const DivisionsLoadingWidget(),
              error:
                  (error, stackTrace) =>
                      DivisionsErrorWidget(errorMessage: error.toString(), onRetry: () => ref.invalidate(divisionsProvider)),
            ),
          ),
        ],
      ),
    );
  }
}
