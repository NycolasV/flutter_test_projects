import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class SavedSuggestionsScreen extends StatelessWidget {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<WordPair> saved;

  SavedSuggestionsScreen({Key key, @required this.saved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Iterable<ListTile> tiles = saved.map((WordPair pair) {
      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      );
    });

    final List<Widget> divided = ListTile
        .divideTiles(context: context, tiles: tiles).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),

      body: ListView(
        children: divided,
      ),
    );
  }
}
