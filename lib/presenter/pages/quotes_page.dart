import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../bloc/quotes_bloc.dart';
import '../bloc/quotes_state.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  final quotesBloc = Modular.get<QuotesBloc>();

  @override
  void initState() {
    quotesBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
        actions: [
          IconButton(onPressed: () => quotesBloc(), icon: const Icon(Icons.refresh)),
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<QuotesBloc, QuotesState>(
          bloc: quotesBloc,
          builder: (context, state) {
            if (state is QuotesLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is QuotesSuccess) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Total: ${quotesBloc.quotes?.results.length}'),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: quotesBloc.quotes?.results.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: ListTile(
                          title: Text(quotesBloc.quotes?.results[index].content ?? ''),
                          subtitle: Text(quotesBloc.quotes?.results[index].author ?? ''),
                          onTap: () async {
                            await Modular.to.pushNamed(
                              '/quotes-details/',
                              arguments: quotesBloc.quotes?.results[index].id,
                            );
                            setState(() {});
                          },
                        ),
                      );
                    },
                  ),
                ],
              );
            }

            if (state is QuotesError) {
              return Center(child: Text(state.message));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    quotesBloc.close();
    super.dispose();
  }
}
