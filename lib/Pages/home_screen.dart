import 'package:flutter/material.dart';
import 'package:harish_portfolio/Components/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AppBarContainer(),
        ],
      ),
    );
  }
}
