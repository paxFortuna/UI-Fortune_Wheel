import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:ui_fortune_wheel/bar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  StreamController<int> selected = StreamController<int>();

  @override
  void dispose() {
    selected.close();
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
        title: Text('Flutter Fortune Wheel'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected.add(
              Fortune.randomInt(0, items.length),
            );
          });
        },
        child: Column(
          children: [
            Expanded(
              child: FortuneWheel(
                selected: selected.stream,
                items: [
                  for (var it in items) FortuneItem(child: Text(it)),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    selected.add(
                      Fortune.randomInt(0, items.length),
                    );
                  });
                },
                child: Text('Roll')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BarPage()),
                  );
                },
                child: Text('Bar Page')),
          ],
        ),
      ),
    );
  }
}

// void main() {
//   configureApp();
//   runApp(DemoApp());
// }
//
// class DemoApp extends StatefulWidget {
//   @override
//   _DemoAppState createState() => _DemoAppState();
// }
//
// class _DemoAppState extends State<DemoApp> {
//   final _appRouter = AppRouter();
//
//   @override
//   Widget build(BuildContext context) {
//     return ThemeModeScope(
//       builder: (context, themeMode) {
//         return MaterialApp.router(
//           title: 'Fortune Wheel Demo',
//           theme: lightTheme,
//           darkTheme: darkTheme,
//           themeMode: themeMode,
//           routerDelegate: _appRouter.delegate(),
//           routeInformationParser: _appRouter.defaultRouteParser(),
//         );
//       },
//     );
//   }
// }
