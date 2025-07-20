import 'package:flutter/material.dart';
import 'package:harish_portfolio/Pages/home_screen.dart';
import 'package:harish_portfolio/Pages/navigation_bar_screen.dart';
import 'package:harish_portfolio/constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    globalHeight = MediaQuery.of(context).size.height;
    globalWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Preahvihear',
        brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}
