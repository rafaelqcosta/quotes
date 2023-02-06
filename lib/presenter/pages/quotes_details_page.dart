// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../bloc/quote_bloc.dart';
import '../bloc/quotes_bloc.dart';
import '../bloc/quotes_state.dart';

class QuotesDetailsPage extends StatefulWidget {
  final String id;
  const QuotesDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _QuotesDetailsPageState createState() => _QuotesDetailsPageState();
}

class _QuotesDetailsPageState extends State<QuotesDetailsPage> {
  final quoteBloc = Modular.get<QuoteBloc>();
  final quotesBloc = Modular.get<QuotesBloc>();
  @override
  void initState() {
    quoteBloc(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quote Details'),
      ),
      body: BlocBuilder<QuoteBloc, QuotesState>(
        bloc: quoteBloc,
        builder: (context, state) {
          if (state is QuotesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is QuoteSuccess) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  _text(state.quote.content, 25),
                  _text(state.quote.author, 18),
                  _text('#${state.quote.tags.join(" #").trim().replaceAll('Tag.', '')}', 18),
                  _text('Date Added: ${DateFormat.yMMMd().format(state.quote.dateAdded)}', 12),
                  _text('Date Modified: ${DateFormat.yMMMd().format(state.quote.dateModified)}', 12),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              quotesBloc.removeResult(state.quote);
                              Modular.to.pop();
                            },
                            style: FilledButton.styleFrom(backgroundColor: Colors.grey),
                            child: const Text('Delete'),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: FilledButton(
                            onPressed: () {
                              quoteBloc(widget.id);
                            },
                            child: const Text('Update'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is QuotesError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _text(String text, double size) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(fontSize: size),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
