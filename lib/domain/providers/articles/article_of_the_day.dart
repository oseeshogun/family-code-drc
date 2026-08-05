import 'dart:math';

import 'package:family_code/data/repositories/article_repository_impl.dart';
import 'package:family_code/domain/entities/article.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'article_of_the_day.g.dart';

/// Key used to store the article of the day visibility in SharedPreferences
const String _articleOfDayVisibilityKey = 'article_of_day_hidden_date';

@riverpod
Future<int> articleOfTheDayId(Ref ref) async {
  final prefs = await SharedPreferences.getInstance();
  final today = DateTime.now().toIso8601String().split('T')[0]; // Get current date in YYYY-MM-DD format
  final lastUpdateDate = prefs.getString('article_of_day_date');
  final savedArticleId = prefs.getInt('article_of_day_id');

  final repository = ref.watch(articleRepositoryProvider);
  final total = await repository.articlesCount().first;

  if (lastUpdateDate == today && savedArticleId != null && savedArticleId <= total) {
    return savedArticleId;
  }

  final random = Random();
  final articleId = random.nextInt(total) + 1;

  await prefs.setString('article_of_day_date', today);
  await prefs.setInt('article_of_day_id', articleId);

  return articleId;
}

@riverpod
Future<ArticleEntity> articleOfTheDay(Ref ref) async {
  final articleId = await ref.watch(articleOfTheDayIdProvider.future);
  final repository = ref.watch(articleRepositoryProvider);
  return await repository.getArticleById(articleId);
}

@riverpod
class ArticleOfDayVisibility extends _$ArticleOfDayVisibility {
  @override
  Future<bool> build() async {
    return _isArticleOfDayVisible();
  }

  Future<bool> _isArticleOfDayVisible() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().split('T')[0];
    final hiddenDate = prefs.getString(_articleOfDayVisibilityKey);

    return hiddenDate != today;
  }

  Future<void> hideForToday() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().split('T')[0];
    await prefs.setString(_articleOfDayVisibilityKey, today);
    state = const AsyncValue.data(false);
  }

  Future<void> show() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_articleOfDayVisibilityKey);
    state = const AsyncValue.data(true);
  }
}
