import 'package:flutter/material.dart';
import 'package:quotes/view/homescreen.dart';

import 'view/pdf.dart';

void main() {
  runApp(const Quotes_app());
}
class Quotes_app extends StatelessWidget {
  const Quotes_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Homescreen(),
      },
    );
  }
}
