import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:family_code/data/repositories/article_repository_impl.dart';
import 'package:family_code/domain/providers/articles/article.dart';
import 'package:family_code/core/presentations/providers/flutter_tts.dart';
import 'package:family_code/core/router/routes.dart';
import 'package:family_code/presentation/widgets/banner_ad_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class ArticleScreen extends HookConsumerWidget {
  final int id;
  const ArticleScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleRepository = ref.read(articleRepositoryProvider);
    final articleAsyncValue = ref.watch(articleProvider(id));
    final articleCountAsync = ref.watch(articleCountProvider);
    final tts = ref.watch(ttsProvider).value;
    final isReading = useState(false);

    const packageName = 'com.oseemasuaku.family_code';
    final androidUrl = 'https://play.google.com/store/apps/details?id=$packageName';

    speak(String text) {
      isReading.value = tts != null;
      tts?.speak(text);
      tts?.setCompletionHandler(() {
        isReading.value = false;
      });
    }

    useEffect(() {
      return () => tts?.stop();
    }, [tts]);

    return Scaffold(
      appBar: AppBar(
        title: articleAsyncValue.when(
          data: (article) =>
              Text('Article ${article.numero}', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 24.0)),
          loading: () => const Text('Article', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24.0)),
          error: (_, _) => const Text('Article', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24.0)),
        ),
        actions: [
          if (isReading.value)
            IconButton(icon: const Icon(Icons.close), onPressed: () => tts?.stop(), tooltip: 'Stop Reading'),
          articleAsyncValue.when(
            error: (error, stackTrace) => SizedBox.shrink(),
            loading: () => SizedBox.shrink(),
            data: (article) {
              return Row(
                children: [
                  IconButton(
                    onPressed: () {
                      final box = context.findRenderObject() as RenderBox?;
                      final origin = box != null ? box.localToGlobal(Offset.zero) & box.size : null;
                      SharePlus.instance.share(
                        ShareParams(
                          text: 'Article ${article.numero} - Code de la Famille\n\n${article.contenu}\n\n$androidUrl',
                          sharePositionOrigin: origin,
                        ),
                      );
                    },
                    icon: const Icon(Icons.share),
                    tooltip: 'Partager l\'article',
                  ),
                  IconButton(
                    onPressed: () {
                      articleRepository.toggleArticleToFavorite(article.id).catchError((_) {
                        if (context.mounted) {
                          showOkAlertDialog(
                            context: context,
                            message: 'Une erreur est survenue lors de l\'ajout aux favoris.',
                          );
                        }
                      });
                    },
                    icon: Icon(article.isFavorite ? Icons.favorite : Icons.favorite_border),
                    tooltip: article.isFavorite ? 'Déjà dans les favoris' : 'Ajouter aux favoris',
                  ),
                ],
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: articleAsyncValue.when(
              data: (article) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Article ${article.numero}', style: const TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 10),
                          if (!isReading.value)
                            IconButton(
                              onPressed: () => speak(article.contenu),
                              icon: const Icon(Icons.volume_up),
                              tooltip: 'Lire',
                            )
                          else
                            const Icon(Icons.voice_chat, color: Colors.grey),
                          const Spacer(),
                          if (article.statut == 'abroge')
                            const Chip(label: Text('Abrogé', style: TextStyle(fontSize: 11))),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(article.contenu),
                    ],
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stack) => Center(child: Text('Error: $error')),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BannerAdWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: articleCountAsync.when(
                data: (total) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (id > 1)
                        FilledButton.tonalIcon(
                          onPressed: () => ArticleRoute(id - 1).replace(context),
                          icon: const Icon(Icons.arrow_back),
                          label: const Text('Précédent'),
                        )
                      else
                        const SizedBox.shrink(),
                      if (id < total)
                        FilledButton.tonalIcon(
                          onPressed: () => ArticleRoute(id + 1).replace(context),
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text('Suivant'),
                        ),
                    ],
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (_, _) => const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
