import 'package:basic_calculator_using_flutter/home_page.dart';
import 'package:flutter/material.dart';

class SumApp extends StatelessWidget {
  const SumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),);
  }
}
