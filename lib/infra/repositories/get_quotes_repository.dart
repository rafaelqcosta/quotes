import 'package:dartz/dartz.dart';
import 'package:quotes/domain/entities/quotes_entity.dart';
import 'package:quotes/infra/adapters/quotes_adapter.dart';

import '../../core/failure.dart';
import '../../domain/entities/quote_entity.dart';
import '../../domain/repositories/get_quotes_repository.dart';
import '../adapters/quote_adapter.dart';
import '../datasources/get_quotes_datasource.dart';

class GetQuotesRepository implements IGetQuotesRepository {
  final IGetQuotesDataSource dataSource;

  GetQuotesRepository(this.dataSource);

  @override
  Future<Either<Failure, QuotesEntity>> getList() async {
    try {
      final data = await dataSource.getList();
      try {
        return Right(QuotesAdapter.fromMap(data));
      } catch (e) {
        throw JsonParseFailure();
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, QuoteEntity>> getById(String id) async {
    try {
      final data = await dataSource.getById(id);
      try {
        return Right(QuoteAdapter.fromMap(data));
      } catch (e) {
        throw JsonParseFailure();
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
