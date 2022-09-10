import 'package:flutter/material.dart';
import 'gamePageWidget.dart';

class GameDetailsWidget extends StatefulWidget {
  final int gamesId;
  const GameDetailsWidget({Key? key, required this.gamesId}) : super(key: key);

  @override
  State<GameDetailsWidget> createState() => _GameDetailsWidgetState();
}

class _GameDetailsWidgetState extends State<GameDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RAWG'),
      ),
      body: const GamePageWidget(),
    );
  }
}
