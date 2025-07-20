import 'dart:async';
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:harish_portfolio/Components/app_bar.dart';
import 'package:harish_portfolio/constant.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:rive/rive.dart' as rive;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHover = false;
  Timer? _timer;
  String isSelected = 'Home';
  Color _containerColor = Colors.blue;

  void _changeColor() {
    setState(() {
      _containerColor = _getRandomColor();
    });
  }

  Color _getRandomColor() {
    return Color.fromARGB(
      255,
      Random().nextInt(256), // R
      Random().nextInt(256), // G
      Random().nextInt(256), // B
    );
  }

  @override
  void initState() {
    // _timer = Timer.periodic(
    //   const Duration(milliseconds: 2000),
    //   (timer) {
    //     _changeColor();
    //   },
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    globalHeight = MediaQuery.of(context).size.height;
    globalWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          const SizedBox.expand(
            child: rive.RiveAnimation.asset(
              'assets/animation/background.riv',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            child: Expanded(
              child: SingleChildScrollView(
                child: ScrollTransformView(
                  children: [
                    ScrollTransformItem(
                      builder: (scrollOffset) => Column(
                        children: [
                          AppBarContainer(
                            ontap: (tab) => setState(() {
                              isSelected = tab;
                            }),
                            title: isSelected,
                          ),
                          isSelected == 'Home'
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 200.0, vertical: 50),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AnimatedTextKit(
                                                repeatForever: true,
                                                animatedTexts: [
                                                  ColorizeAnimatedText(
                                                    "I'm Harish P",
                                                    textStyle: const TextStyle(
                                                        fontFamily:
                                                            'Preahvihear',
                                                        fontSize: 50,
                                                        color: Colors.white),
                                                    colors: [
                                                      Colors.purple,
                                                      Colors.blue,
                                                      Colors.yellow,
                                                      Colors.red,
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 20),
                                              AnimatedTextKit(
                                                repeatForever: true,
                                                animatedTexts: [
                                                  TypewriterAnimatedText(
                                                    "Flutter Developer",
                                                    speed: const Duration(
                                                        milliseconds: 200),
                                                    textStyle: const TextStyle(
                                                        fontFamily:
                                                            'Preahvihear',
                                                        fontSize: 50,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 60),
                                              const Row(
                                                spacing: 10,
                                                children: [
                                                  HoverAppBarButton(
                                                      text: 'GitHub',
                                                      imagePath:
                                                          'assets/png/github.png'),
                                                  HoverAppBarButton(
                                                      text: 'Linked in',
                                                      imagePath:
                                                          'assets/png/linkedin.png'),
                                                  HoverAppBarButton(
                                                      text: 'Resume',
                                                      imagePath:
                                                          'assets/png/linkedin.png'),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(400),
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 40,
                                                  blurStyle: BlurStyle.outer,
                                                  color: Color(0xffCBAE87),
                                                  // _containerColor,
                                                  offset: Offset(0, 0),
                                                  // spreadRadius: 10,
                                                )
                                              ],
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(400),
                                              child: Image.asset(
                                                'assets/png/profile.jpg',
                                                fit: BoxFit.contain,
                                                height: 300,
                                                width: 300,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 100),
                                      const Text(
                                        "I am a passionate Flutter developer focused on building responsive and user-friendly mobile apps. I’ve built a strong foundation in Flutter and Dart through self-learning and hands-on projects. I'm excited to contribute to real-world applications and grow as a developer.",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 100),
                                      const Text(
                                        'Work Experience',
                                        style: TextStyle(
                                          fontFamily: 'Preahvihear',
                                          fontSize: 40,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        'Lentera Technologies Pvt. Ltd.',
                                        style: TextStyle(
                                          fontFamily: 'Preahvihear',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HoverAppBarButton extends StatefulWidget {
  final String text;
  final String imagePath;

  const HoverAppBarButton({
    super.key,
    required this.text,
    required this.imagePath,
  });

  @override
  State<HoverAppBarButton> createState() => _HoverAppBarButtonState();
}

class _HoverAppBarButtonState extends State<HoverAppBarButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() => isHover = true);
      },
      onExit: (event) {
        setState(() => isHover = false);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: isHover ? Colors.white30 : Colors.black,
          border: Border.all(
            color: Colors.white30,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                widget.imagePath,
                color: Colors.white,
                height: 20,
              ),
              Text(
                widget.text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
