import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Search'),
      ),
      body: Column(
        children: [
           TextField(
            decoration: InputDecoration(
              hintText: 'Search',
            ),
            onChanged: (value) => print(value),
          ),
          const Expanded(
            child: Center(
              child: Text('Search for something!'),
            ),
          ),
        ],
      ),
    );
  }
}
