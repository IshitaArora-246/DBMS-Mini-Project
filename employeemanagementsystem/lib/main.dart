import 'package:employeemanagementsystem/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  // filter: null,
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 20,
    colors: false,
    printEmojis: true,
    printTime: false,
    noBoxingByDefault: false,
    excludeBox: {Level.verbose: false},
  ),
);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Employee Manager',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
