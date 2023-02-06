import 'package:quotes/infra/adapters/quote_adapter.dart';

import '../../domain/entities/quotes_entity.dart';

class QuotesAdapter extends QuotesEntity {
  QuotesAdapter({
    required super.count,
    required super.totalCount,
    required super.page,
    required super.totalPages,
    required super.lastItemIndex,
    required super.results,
  });

  factory QuotesAdapter.fromMap(Map<String, dynamic> map) {
    return QuotesAdapter(
      count: map["count"],
      totalCount: map["totalCount"],
      page: map["page"],
      totalPages: map["totalPages"],
      lastItemIndex: map["lastItemIndex"],
      results: List<QuoteAdapter>.from(map["results"].map((x) => QuoteAdapter.fromMap(x))),
    );
  }
}
