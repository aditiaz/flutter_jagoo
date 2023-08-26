import 'package:flutter/material.dart';

import 'package:jagoo_latihan/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(0, 119, 182, 1)),
        useMaterial3: true,
      ),
      home:  Home(),
    );
  }
}



