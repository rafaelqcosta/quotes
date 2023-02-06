import 'package:dio/dio.dart';
import 'package:quotes/core/failure.dart';

import '../infra/datasources/get_quotes_datasource.dart';

class GetQuotesDataSource implements IGetQuotesDataSource {
  final Dio dio = Dio();
  @override
  Future<dynamic> getList() async {
    try {
      final result = await dio.get('https://quotable.io/quotes?page=1&limit=10');
      return result.data;
    } on Exception catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<dynamic> getById(String id) async {
    try {
      final result = await dio.get('https://quotable.io/quotes/$id');
      return result.data;
    } on Exception catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
