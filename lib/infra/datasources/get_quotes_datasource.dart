abstract class IGetQuotesDataSource {
  Future<dynamic> getList();
  Future<dynamic> getById(String id);
}
