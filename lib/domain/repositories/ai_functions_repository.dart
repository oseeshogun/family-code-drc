mixin AiFunctionsRepository {
  Future<Map<String, dynamic>> getCodeStructure();

  Future<List<Map<String, dynamic>>> searchArticles({required List<String> keywords, int? divisionId, int limit = 5});

  Future<Map<String, dynamic>?> getArticleByNumero(String numero);
}
