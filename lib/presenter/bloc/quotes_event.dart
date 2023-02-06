import 'package:equatable/equatable.dart';

abstract class QuotesEvent extends Equatable {
  const QuotesEvent();
}

class GetQuotesEvent extends QuotesEvent {
  @override
  List<Object> get props => [];
}
