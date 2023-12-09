import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technaureus_machine_test/view/core/core.dart';
import 'package:technaureus_machine_test/view/screens/my_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Technaureus Machine Test',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const MyAppScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            const Icon(
              Icons.groups,
              size: 40,
            ),
            const Icon(
              Icons.subdirectory_arrow_left,
              size: 40,
            ),
            const Icon(
              Icons.post_add,
              size: 40,
            ),
            const Icon(
              Icons.receipt_long,
              size: 40,
            ),
            const Icon(
              Icons.route,
              size: 40,
            ),
            const Icon(
              Icons.fact_check,
              size: 40,
            ),
            const Icon(
              Icons.receipt,
              size: 40,
            ),
            const Icon(
              CupertinoIcons.cube_box,
              size: 40,
            ),
            const Icon(
              CupertinoIcons.arrow_uturn_left_square,
              size: 40,
            ),
            const Icon(
              CupertinoIcons.qrcode_viewfinder,
              size: 40,
            ),
            const Icon(
              CupertinoIcons.square_favorites,
              size: 40,
            ),
            const Icon(
              CupertinoIcons.bars,
              size: 40,
            ),
            FaIcon(
              FontAwesomeIcons.barsStaggered,
              size: 50,
              color: Colors.red,
            ),
            Icon(
              FontAwesomeIcons.coins,
              color: Colors.lime,
              size: 30,
            ),
            Icon(
              FontAwesomeIcons.personWalkingArrowRight,
              color: Colors.amber,
              size: 30,
            ),
            Text(
              'counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'counter',
              style: kHeadlineMedium!.copyWith(color: Colors.black45),
            ),
          ],
        ),
      ),
    );
  }
}
