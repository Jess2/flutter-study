import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RandomListState();
  }
}

class _RandomListState extends State<RandomList> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jess2")),
      body: ListView.builder(itemBuilder: (context, index) {
        // 0, 2, 4, ... : real items
        // 1, 3, 5, ... : dividers
        if (index.isOdd) {
          return Divider();
        }

        var realIndex = index ~/ 2;

        if (realIndex >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return ListTile(
            title: Text(
          _suggestions[realIndex].asPascalCase,
          textScaleFactor: 1.5,
        ));
      }),
      // body: Center(child: Text(randomWord.asPascalCase, textScaleFactor: 1.5,))
    );
  }
}
