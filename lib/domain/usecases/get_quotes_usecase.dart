import 'package:dartz/dartz.dart';

import '../../core/failure.dart';
import '../entities/quote_entity.dart';
import '../entities/quotes_entity.dart';
import '../repositories/get_quotes_repository.dart';

abstract class IGetQuotesUseCase {
  Future<Either<Failure, QuotesEntity>> getList();
  Future<Either<Failure, QuoteEntity>> getById(String id);
}

class GetQuotesUseCase implements IGetQuotesUseCase {
  final IGetQuotesRepository repository;
  GetQuotesUseCase(this.repository);

  @override
  Future<Either<Failure, QuotesEntity>> getList() async {
    final result = await repository.getList();
    return result;
  }

  @override
  Future<Either<Failure, QuoteEntity>> getById(String id) async {
    final result = await repository.getById(id);
    return result;
  }
}
