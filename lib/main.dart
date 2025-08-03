import 'package:flutter/material.dart';
import 'package:harish_portfolio/Pages/desktop_screen.dart';
import 'package:harish_portfolio/Pages/mobile_screen.dart';
import 'package:harish_portfolio/Pages/responsive_layout.dart';
import 'package:harish_portfolio/Pages/tablet_screen.dart';
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
        brightness: Brightness.dark,
      ),
      home: const ResponsiveLayout(
        mobile: MobileScreen(),
        desktop: DesktopScreen(),
        tablet: TabletScreen(),
      ),
    );
  }
}
