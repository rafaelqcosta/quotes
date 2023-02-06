// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/domain/usecases/get_quotes_usecase.dart';

import '../../domain/entities/quote_entity.dart';
import '../../domain/entities/quotes_entity.dart';
import 'quotes_state.dart';

class QuotesBloc extends Cubit<QuotesState> {
  final IGetQuotesUseCase getQuotesUseCase;
  QuotesEntity? quotes;

  QuotesBloc(this.getQuotesUseCase) : super(QuotesLoading());

  Future call() async {
    emit(QuotesLoading());
    final response = await getQuotesUseCase.getList();
    response.fold((failure) async {
      emit(QuotesError(message: failure.message));
    }, (quote) async {
      quotes = quote;
      emit(const QuotesSuccess());
    });
  }

  void removeResult(QuoteEntity result) {
    final item = quotes?.results.firstWhere((x) => x.id == result.id);
    quotes?.results.remove(item);
  }
}
