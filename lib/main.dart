import 'package:flutter/material.dart';
import 'package:flutter_testing/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //localstorage dependency
  await Hive.initFlutter();

  var memoryBox = await Hive.openBox('memoryBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(backgroundColor: Colors.purple[900])
      )
    );
  }
}