import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_bloc_event_example/search/bloc/search_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => SearchBloc(),
        child: SearchScreen(),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Search BLoC Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return TextField(
                  onChanged: (query) {
                    searchBloc.add(SearchEvent.search(query));
                  },
                  decoration: InputDecoration(
                    hintText: 'Search...',
                  ),
                );
              },
            ),
            SizedBox(height: 16.0),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return state.when(
                  initial: () => Text('No search query yet.'),
                  loading: () => CircularProgressIndicator(),
                  loaded: (query) => Text('Search Query: $query'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
