import 'package:flutter_modular/flutter_modular.dart';
import 'package:quotes/domain/repositories/get_quotes_repository.dart';
import 'package:quotes/domain/usecases/get_quotes_usecase.dart';
import 'package:quotes/external/get_quotes_datasource.dart';
import 'package:quotes/infra/datasources/get_quotes_datasource.dart';
import 'package:quotes/infra/repositories/get_quotes_repository.dart';
import 'package:quotes/presenter/bloc/quotes_bloc.dart';
import 'package:quotes/presenter/pages/quotes_page.dart';

import 'presenter/bloc/quote_bloc.dart';
import 'presenter/pages/quotes_details_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<IGetQuotesDataSource>((i) => GetQuotesDataSource()),
        Bind.factory<IGetQuotesRepository>((i) => GetQuotesRepository(i())),
        Bind.factory<IGetQuotesUseCase>((i) => GetQuotesUseCase(i())),
        Bind.lazySingleton((i) => QuotesBloc(i())),
        Bind.lazySingleton((i) => QuoteBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const QuotesPage()),
        ChildRoute(
          '/quotes-details/',
          child: (context, args) => QuotesDetailsPage(
            id: args.data,
          ),
        ),
      ];
}
