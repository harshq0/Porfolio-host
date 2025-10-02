import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:harish_portfolio/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class DummyScreen extends StatefulWidget {
  const DummyScreen({super.key});

  @override
  State<DummyScreen> createState() => _DummyScreenState();
}

class _DummyScreenState extends State<DummyScreen> {
  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    globalHeight = MediaQuery.of(context).size.height;
    globalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff11071F),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 60,
            pinned: true,
            backgroundColor: Color(0xff1A0B2E),
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 150,
              children: [
                Text(
                  'Home',
                  style: TextStyle(
                    fontFamily: 'Preahvihear',
                    fontSize: 17.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'About',
                  style: TextStyle(
                    fontFamily: 'Preahvihear',
                    fontSize: 17.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 130),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 400.0, vertical: 60),
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: BoxDecoration(
                            gradient: const RadialGradient(
                              // focalRadius: 20,
                              // transform: GradientRotation(20),
                              colors: [
                                Colors.white,
                                Color(0xff38215B),
                                Color(0xff230F44),
                                Color(0xff11071F),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(400),
                            child: Image.asset(
                              'assets/png/flutter.png',
                              fit: BoxFit.contain,
                              height: 100,
                              width: 100,
                            ),
                          ),
                        ),
                      ),
                      const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                "Hello! I Am ",
                                style: TextStyle(
                                  fontFamily: 'Preahvihear',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  color: Colors.white,
                                ),
                              ),
                              AutoSizeText(
                                "Harish.P",
                                style: TextStyle(
                                  fontFamily: 'Preahvihear',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 19,
                                  color: Color(0xff7127BA),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        left: 585,
                        top: 20,
                        child: Image.asset('assets/png/arrow-pointer.png'),
                      ),
                      const Positioned(
                        left: 650,
                        top: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'A Developer who',
                              style: TextStyle(
                                fontFamily: 'Preahvihear',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'Build a user-friendly application,\n',
                                    style: TextStyle(
                                      fontFamily: 'Preahvihear',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Responsive with ',
                                    style: TextStyle(
                                      fontFamily: 'Preahvihear',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Flutter magic',
                                    style: TextStyle(
                                      fontFamily: 'Preahvihear',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30,
                                      color: Color(0xff7127BA),
                                    ),
                                  ),
                                  TextSpan(
                                    text: '...',
                                    style: TextStyle(
                                      fontFamily: 'Preahvihear',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'One codebase, every platform, delivering smooth apps everywhere you go!',
                              style: TextStyle(
                                fontFamily: 'Preahvihear',
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // const Text(
                  //   "I'm a Flutter Developer. |",
                  //   style: TextStyle(
                  //     wordSpacing: 5,
                  //     fontFamily: 'Preahvihear',
                  //     fontWeight: FontWeight.w500,
                  //     fontSize: 35,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     const Text(
                  //       "Currently, I'm a Flutter Developer at ",
                  //       style: TextStyle(
                  //         wordSpacing: 5,
                  //         fontFamily: 'Preahvihear',
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 25,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //     Text(
                  //       "Lentera Technologies Pvt. Ltd...",
                  //       style: TextStyle(
                  //         wordSpacing: 5,
                  //         fontFamily: 'Preahvihear',
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 25,
                  //         color: Colors.green.shade500,
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 300.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SizedBox(height: 70),
                        const Text(
                            "I am a self-taught Flutter developer  with 1+ years in the industry. My focus is on crafting meaningful and delightful digital products that establish an equilibrium between user needs and business objectives. I specialize in building user-friendly, responsive, and high-performance applications.",
                            style: TextStyle(
                              fontFamily: 'Preahvihear',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.white,
                            )),
                        const SizedBox(height: 100),
                        const Text(
                          'Work Experience',
                          style: TextStyle(
                            fontFamily: 'Preahvihear',
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Column(
                          spacing: 20,
                          children: [
                            Container(
                              width: globalWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff130428),
                                    Color(0xff251043),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/png/company-image.png',
                                      height: 60,
                                    ),
                                    const SizedBox(width: 15),

                                    // Left text
                                    const Text(
                                      'I am working at Lentera Technologies Private Limited',
                                      style: TextStyle(
                                        fontFamily: 'poppins-medium',
                                        fontSize: 16.5,
                                        fontWeight: FontWeight.w500,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),

                                    // Pushes the date to the right
                                    const Spacer(),

                                    // Right text
                                    const Text(
                                      'Sept 2024 - Present',
                                      style: TextStyle(
                                        fontFamily: 'poppins-medium',
                                        fontSize: 16.5,
                                        fontWeight: FontWeight.w500,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Row(
                            //   children: [
                            //     experienceContainer(
                            //         gradient: const LinearGradient(
                            //           begin: Alignment.topLeft,
                            //           end: Alignment.bottomRight,
                            //           colors: [
                            //             Color(0xff130428),
                            //             Color(0xff251043),
                            //             // Color(0xff38126D),
                            //             // Color(0xff261045),
                            //             // Color(0xff190634),
                            //           ],
                            //         ),
                            //         image: 'assets/png/company-image.png',
                            //         text:
                            //             'I Working at Lentera Technologies \nPrivate Limited '),
                            //     const Spacer(),
                            //   ],
                            // ),
                            Row(
                              children: [
                                experienceContainer(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff130428),
                                        Color(0xff251043),
                                        // Color(0xff38126D),
                                        // Color(0xff261045),
                                        // Color(0xff190634),
                                      ],
                                    ),
                                    image: 'assets/png/responsive-image.png',
                                    text:
                                        'Developed and maintained \ncross-platform mobile \napplications using Flutter and Dart'),
                                const Spacer(),
                                experienceContainer(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff130428),
                                        Color(0xff251043),
                                        Color(0xff38126D),
                                        Color(0xff261045),
                                        Color(0xff190634),
                                      ],
                                    ),
                                    image: 'assets/png/api-image.png',
                                    text:
                                        'Implemented REST API integrations \nto support real-time data flow \nand enhance appresponsiveness.')
                              ],
                            ),
                            Row(
                              children: [
                                experienceContainer(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff130428),
                                        Color(0xff251043),
                                        // Color(0xff38126D),
                                        // Color(0xff261045),
                                        // Color(0xff190634),
                                      ],
                                    ),
                                    image: 'assets/png/notification-image.png',
                                    text:
                                        'Integrated FCM \n(Firebase Cloud Messaging) for \npush notifications \nand real-time alerts.'),
                                const Spacer(),
                                experienceContainer(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff261045),
                                        Color(0xff130428),

                                        // Color(0xff38126D),
                                        // Color(0xff261045),
                                        // Color(0xff190634),
                                      ],
                                    ),
                                    image: 'assets/png/optimize-image.png',
                                    text:
                                        'Focused on performance \noptimization, error handling, \nand smooth UI transitions.')
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        const AutoSizeText(
                          'Studies',
                          style: TextStyle(
                            fontFamily: 'Preahvihear',
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: globalWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff130428),
                                Color(0xff251043),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/png/college-image.png',
                                  height: 60,
                                ),
                                const SizedBox(width: 15),

                                // Left text
                                const Text(
                                  'SRM Valliammai Engineering College\nB.E Computer Science and Engineering',
                                  style: TextStyle(
                                    fontFamily: 'poppins-medium',
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),

                                // Pushes the date to the right
                                const Spacer(),

                                // Right text
                                const Text(
                                  'July 2019 - May 2023',
                                  style: TextStyle(
                                    fontFamily: 'poppins-medium',
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 60),
                        const Text(
                          'Technologies',
                          style: TextStyle(
                            fontFamily: 'Preahvihear',
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Column(
                          children: [
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'I don’t just learn tech,',
                                    style: TextStyle(
                                      fontFamily: 'Preahvihear',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' I turn it into experiences!',
                                    style: TextStyle(
                                      fontFamily: 'Preahvihear',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 25,
                                      color: Color(0xff7127BA),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 40),
                            Image.asset('assets/png/technologies.png'),
                          ],
                        ),
                        const SizedBox(height: 50),

                        Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Projects',
                                  style: TextStyle(
                                    fontFamily: 'poppins-semiBold',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xff7127BA),
                                  ),
                                ),
                                const Text(
                                  'IOT Based Solar Panel Application',
                                  style: TextStyle(
                                    fontFamily: 'poppins-semiBold',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                projectContainer(
                                    technologiesText:
                                        'Flutter, Dart, REST API, FCM, Rasorpay (Payment Gateway).',
                                    text:
                                        'I built a responsive design for both Android and iOS applications for customer and installer sides using the Flutter framework. I implemented REST API integrations to support real-time data flow and improve app responsiveness. I integrated Firebase Cloud Messaging (FCM) for push notifications and real-time alerts. I focused on performance optimization, error handling, and ensuring smooth UI transitions. '),
                              ],
                            ),
                            const SizedBox(height: 50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'Projects',
                                  style: TextStyle(
                                    fontFamily: 'poppins-semiBold',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xff7127BA),
                                  ),
                                ),
                                const Text(
                                  'Henkal Digital Presenter Application',
                                  style: TextStyle(
                                    fontFamily: 'poppins-semiBold',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                projectContainer(
                                    technologiesText:
                                        'Flutter, Dart, REST API, Provider (State Management), MVVM.',
                                    text:
                                        'HDP is a digital presenter application that allows users to create, manage, and present digital content seamlessly. The app provides an intuitive interface for users to organize their presentations, add multimedia elements, and deliver engaging presentations on various devices. With HDP, users can easily share their presentations with others and collaborate in real-time. The app is designed to enhance the presentation experience, making it more interactive and impactful.'),
                              ],
                            ),
                            const SizedBox(height: 50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Projects',
                                  style: TextStyle(
                                    fontFamily: 'poppins-semiBold',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Color(0xff7127BA),
                                  ),
                                ),
                                const Text(
                                  'IOT Based Solar Panel Application',
                                  style: TextStyle(
                                    fontFamily: 'poppins-semiBold',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 30),
                                projectContainer(
                                    technologiesText:
                                        'Flutter, Dart, REST API, FCM, Rasorpay (Payment Gateway).',
                                    text:
                                        'I built a responsive design for both Android and iOS applications for customer and installer sides using the Flutter framework. I implemented REST API integrations to support real-time data flow and improve app responsiveness. I integrated Firebase Cloud Messaging (FCM) for push notifications and real-time alerts. I focused on performance optimization, error handling, and ensuring smooth UI transitions. '),
                              ],
                            ),
                            const SizedBox(height: 50),
                          ],
                        ),
                        const SizedBox(height: 60),

                        const Text(
                          'Contact',
                          style: TextStyle(
                            fontFamily: 'Preahvihear',
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          spacing: 5,
                          children: [
                            Image.asset(
                              'assets/png/mail.png',
                              color: Colors.white,
                              height: 20,
                            ),
                            const Text(
                              'harishselvampanneer@gmail.com',
                              style: TextStyle(
                                fontFamily: 'Preahvihear',
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 40),
                        Row(
                          spacing: 20,
                          children: [
                            socialIcon(
                              tooltipMessage: 'GitHub',
                              image: 'assets/png/github.png',
                              onTap: () =>
                                  _launchURL('https://github.com/harshq0'),
                            ),
                            socialIcon(
                              tooltipMessage: 'LinkedIn',
                              image: 'assets/png/linkedin.png',
                              onTap: () => _launchURL(
                                  'https://www.linkedin.com/in/harish-panneer/'),
                            ),
                            socialIcon(
                              tooltipMessage: 'Resume',
                              image: 'assets/png/resume.png',
                              onTap: () =>
                                  _launchURL('https://github.com/harshq0'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget experienceContainer(
      {required String text,
      required String image,
      required Gradient? gradient}) {
    return Container(
      width: globalWidth / 3.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: gradient,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Row(
          spacing: 15,
          children: [
            Image.asset(
              image,
              height: 60,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontFamily: 'poppins-medium',
                  fontSize: 16.5,
                  fontWeight: FontWeight.w500,
                  overflow: TextOverflow.visible),
            ),
          ],
        ),
      ),
    );
  }

  Widget projectContainer(
      {required String text, required String technologiesText}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
        child: Container(
          width: globalWidth,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                      fontFamily: 'poppins-medium',
                      fontSize: 16.5,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.visible),
                ),
                Text(
                  'Technologoies Used : $technologiesText',
                  style: const TextStyle(
                      fontFamily: 'poppins-medium',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.visible),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget socialIcon(
      {required String image,
      required void Function()? onTap,
      required String tooltipMessage}) {
    return Tooltip(
      message: tooltipMessage,
      textStyle: const TextStyle(
        fontFamily: 'Preahvihear',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Colors.black,
      ),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          image,
          height: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
