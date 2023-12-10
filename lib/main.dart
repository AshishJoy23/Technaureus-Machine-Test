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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
             
              const Icon(
                CupertinoIcons.qrcode_viewfinder,
                size: 40,
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
      ),
    );
  }
}
