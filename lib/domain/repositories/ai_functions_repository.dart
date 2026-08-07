mixin AiFunctionsRepository {
  Future<Map<String, dynamic>> getCodeStructure();

  Future<List<Map<String, dynamic>>> searchArticles({required List<String> keywords, int limit = 12});

  Future<Map<String, dynamic>?> getArticleByNumero(String numero);
}
