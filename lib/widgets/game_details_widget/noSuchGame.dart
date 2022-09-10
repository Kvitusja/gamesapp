import 'package:flutter/material.dart';

class NoSuchGame extends StatelessWidget {
  const NoSuchGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('RAWG'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [const Center(child: Text(style: TextStyle(color: Colors.black, fontSize: 40.0),'No such game'))],
      ),
    );
  }
}
