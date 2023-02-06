// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes/domain/usecases/get_quotes_usecase.dart';

import 'quotes_state.dart';

class QuoteBloc extends Cubit<QuotesState> {
  final IGetQuotesUseCase getQuotesUseCase;

  QuoteBloc(this.getQuotesUseCase) : super(QuotesLoading());

  Future call(String id) async {
    emit(QuotesLoading());
    final response = await getQuotesUseCase.getById(id);
    response.fold((failure) async {
      emit(QuotesError(message: failure.message));
    }, (quote) async {
      emit(QuoteSuccess(quote));
    });
  }
}
