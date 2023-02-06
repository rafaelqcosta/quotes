import 'package:equatable/equatable.dart';

import '../../domain/entities/quote_entity.dart';

abstract class QuotesState extends Equatable {
  const QuotesState();
}

class QuotesLoading extends QuotesState {
  @override
  List<Object> get props => [];
}

class QuotesSuccess extends QuotesState {
  const QuotesSuccess();

  @override
  List<Object> get props => [];
}

class QuoteSuccess extends QuotesState {
  final QuoteEntity quote;
  const QuoteSuccess(this.quote);

  @override
  List<Object> get props => [quote];
}

class QuotesError extends QuotesState {
  final String message;

  const QuotesError({required this.message});

  @override
  List<Object> get props => [message];
}
