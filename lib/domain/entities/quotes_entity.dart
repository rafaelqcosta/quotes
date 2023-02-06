import 'quote_entity.dart';

class QuotesEntity {
  QuotesEntity({
    required this.count,
    required this.totalCount,
    required this.page,
    required this.totalPages,
    required this.lastItemIndex,
    required this.results,
  });

  int count;
  int totalCount;
  int page;
  int totalPages;
  int lastItemIndex;
  List<QuoteEntity> results;
}
