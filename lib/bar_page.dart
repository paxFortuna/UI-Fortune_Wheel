import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class BarPage extends StatefulWidget {
  const BarPage({Key? key}) : super(key: key);

  @override
  State<BarPage> createState() => _BarPageState();
}

class _BarPageState extends State<BarPage> {
  StreamController<int> selected1 = StreamController<int>();

  @override
  void dispose() {
    selected1.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = <String>[
      'Grogu',
      'Mace Windu',
      'Obi-Wan Kenobi',
      'Han Solo',
      'Luke Skywalker',
      'Darth Vader',
      'Yoda',
      'Ahsoka Tano',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Fortune Wheel'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 80, bottom: 50),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selected1.add(
                      Fortune.randomInt(0, items.length),
                    );
                  });
                },
                child: Text('Roll')),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: FortuneBar(
              selected: selected1.stream,
              items: const [
                FortuneItem(child: Text('Han Solo')),
                FortuneItem(child: Text('Yoda')),
                FortuneItem(child: Text('Obi-Wan Kenobi')),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
