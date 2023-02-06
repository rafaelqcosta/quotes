import 'package:dartz/dartz.dart';
import 'package:quotes/domain/entities/quotes_entity.dart';

import '../../core/failure.dart';
import '../entities/quote_entity.dart';

abstract class IGetQuotesRepository {
  Future<Either<Failure, QuotesEntity>> getList();
  Future<Either<Failure, QuoteEntity>> getById(String id);
}
