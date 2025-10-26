import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:harish_portfolio/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey skillKey = GlobalKey();
  final GlobalKey projectKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();
  String appTitle = 'Home';
  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchMailURL(String url) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'harishselvampanneer@gmail.com',
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch $url';
    }
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onScroll() {
    const offsetTolerance = 100.0;

    // Check which section is visible
    void checkSection(GlobalKey key, String sectionName) {
      final context = key.currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero).dy;

          // When section top is near the top of screen
          if (position < offsetTolerance && position > -box.size.height / 8) {
            if (appTitle != sectionName) {
              setState(() => appTitle = sectionName);
            }
          }
        }
      }
    }

    checkSection(homeKey, 'Home');
    checkSection(experienceKey, 'Experience');
    checkSection(skillKey, 'Skills');
    checkSection(projectKey, 'Projects');
    checkSection(contactKey, 'Contact');

    // 👇 Additional check for scroll end
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 50) {
      if (appTitle != 'Contact') {
        setState(() => appTitle = 'Contact');
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    globalHeight = MediaQuery.of(context).size.height;
    globalWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff11071F),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 60,
            pinned: true,
            backgroundColor: const Color(0xff1A0B2E),
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 100,
              children: [
                _appBarTitle(
                  onTap: () {
                    setState(() {
                      appTitle = 'Home';
                      scrollToSection(homeKey);
                    });
                  },
                  title: 'Home',
                  compare: appTitle,
                ),
                _appBarTitle(
                    onTap: () {
                      setState(() {
                        appTitle = 'Experience';
                        scrollToSection(experienceKey);
                      });
                    },
                    title: 'Experience',
                    compare: appTitle),
                _appBarTitle(
                  onTap: () {
                    setState(() {
                      appTitle = 'Skills';
                      scrollToSection(skillKey);
                    });
                  },
                  title: 'Skills',
                  compare: appTitle,
                ),
                _appBarTitle(
                  onTap: () {
                    setState(() {
                      appTitle = 'Projects';
                      scrollToSection(projectKey);
                    });
                  },
                  title: 'Projects',
                  compare: appTitle,
                ),
                _appBarTitle(
                  onTap: () {
                    setState(() {
                      appTitle = 'Contact';
                      scrollToSection(contactKey);
                    });
                  },
                  title: 'Contact',
                  compare: appTitle,
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                key: homeKey,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 130),
                  Stack(
                    children: [
                      // Gradient Circle + Flutter Logo
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 310.0, bottom: 100),
                        child: Container(
                          height: 300,
                          width: 300,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                Colors.white,
                                Color(0xff38215B),
                                Color(0xff230F44),
                                Color(0xff11071F),
                              ],
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/png/flutter.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),

                      // "Hello! I Am Harish.P"
                      const Positioned(
                        top: 0,
                        left: 590,
                        child: Row(
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
                      ),

                      // Arrow pointer
                      Positioned(
                        top: 20,
                        left: 500,
                        child: Image.asset(
                          'assets/png/arrow-pointer.png',
                          height: 50,
                        ),
                      ),

                      // Developer Intro Text
                      const Padding(
                        padding: EdgeInsets.only(
                            top: 100.0, left: 550.0, right: 300.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              'A Developer who',
                              style: TextStyle(
                                fontFamily: 'Preahvihear',
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 15),
                            AutoSizeText.rich(
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
                            AutoSizeText(
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

                  // const AutoSizeText(
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
                  //     const AutoSizeText(
                  //       "Currently, I'm a Flutter Developer at ",
                  //       style: TextStyle(
                  //         wordSpacing: 5,
                  //         fontFamily: 'Preahvihear',
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 25,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //     AutoSizeText(
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
                    padding: const EdgeInsets.symmetric(horizontal: 200.0),
                    child: Column(
                      key: experienceKey,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SizedBox(height: 70),
                        const AutoSizeText(
                            "I am a self-taught Flutter developer  with 1+ years in the industry. My focus is on crafting meaningful and delightful digital products that establish an equilibrium between user needs and business objectives. I specialize in building user-friendly, responsive, and high-performance applications.",
                            style: TextStyle(
                              fontFamily: 'Preahvihear',
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.white,
                            )),
                        const SizedBox(height: 100),
                        const AutoSizeText(
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
                                    Color(0xff130428),
                                    Color(0xff251043),
                                    Color(0xff261045),
                                    Color(0xff38126D),
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
                                    const Expanded(
                                      flex: 6,
                                      child: AutoSizeText(
                                        'I am working at Lentera Technologies Private Limited',
                                        style: TextStyle(
                                          fontFamily: 'poppins-medium',
                                          fontSize: 16.5,
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ),

                                    // Pushes the date to the right
                                    const Spacer(),

                                    // Right text
                                    const Flexible(
                                      flex: 2,
                                      child: AutoSizeText(
                                        'Sept 2024 - Present',
                                        style: TextStyle(
                                          fontFamily: 'poppins-medium',
                                          fontSize: 16.5,
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.visible,
                                        ),
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
                                        Color(0xff38126D),
                                        // Color(0xff261045),
                                        // Color(0xff190634),
                                      ],
                                    ),
                                    image: 'assets/png/responsive-image.png',
                                    text:
                                        'Developed and maintained  cross-platform mobile  applications using Flutter and Dart.'),
                                const Spacer(),
                                experienceContainer(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff130428),
                                        Color(0xff251043),
                                        Color(0xff38126D),
                                      ],
                                    ),
                                    image: 'assets/png/api-image.png',
                                    text:
                                        'Implemented REST API integrations  to support real-time data flow  and enhance appresponsiveness.')
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
                                        Color(0xff38126D),
                                      ],
                                    ),
                                    image: 'assets/png/notification-image.png',
                                    text:
                                        'Integrated FCM  (Firebase Cloud Messaging) for  push notifications  and real-time alerts.'),
                                const Spacer(),
                                experienceContainer(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff130428),
                                        Color(0xff251043),
                                        Color(0xff38126D),
                                      ],
                                    ),
                                    image: 'assets/png/optimize-image.png',
                                    text:
                                        'Focused on performance optimization, error handling, and smooth UI transitions.'),
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
                                Color(0xff130428),
                                Color(0xff251043),
                                Color(0xff261045),
                                Color(0xff38126D),
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
                                const Expanded(
                                  flex: 5,
                                  child: AutoSizeText(
                                    'SRM Valliammai Engineering College B.E Computer Science and Engineering',
                                    style: TextStyle(
                                      fontFamily: 'poppins-medium',
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ),

                                // Pushes the date to the right
                                const Spacer(),

                                // Right text
                                const Flexible(
                                  flex: 2,
                                  child: AutoSizeText(
                                    'July 2019 - May 2023',
                                    style: TextStyle(
                                      fontFamily: 'poppins-medium',
                                      fontSize: 16.5,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 60,
                          key: skillKey,
                        ),
                        const AutoSizeText(
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
                                      fontSize: 22,
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
                            const SizedBox(height: 60),
                            Image.asset('assets/png/skills.png'),
                            // Stack(
                            //   children: [
                            //     Image.asset('assets/png/skills.png'),
                            //     Padding(
                            //       padding:
                            //           EdgeInsets.only(left: globalWidth / 8),
                            //       child: Row(
                            //         children: [
                            //           Tooltip(
                            //             message: 'Flutter',
                            //             child: Image.asset(
                            //                 'assets/png/flutter-logo.png',
                            //                 height: globalHeight / 7),
                            //           ),
                            //           SizedBox(width: globalWidth / 30),
                            //           Tooltip(
                            //             message: 'Flutter',
                            //             child: Image.asset(
                            //               'assets/png/dart-logo.png',
                            //               height: 70,
                            //             ),
                            //           ),
                            //           SizedBox(width: globalWidth / 30),
                            //           Tooltip(
                            //             message: 'Flutter',
                            //             child: Image.asset(
                            //               'assets/png/firebase-logo.png',
                            //               height: globalHeight / 8,
                            //             ),
                            //           ),
                            //           SizedBox(width: globalWidth / 35),
                            //           Tooltip(
                            //             message: 'Flutter',
                            //             child: Image.asset(
                            //               'assets/png/bloc-logo.png',
                            //               height: globalHeight / 9,
                            //             ),
                            //           ),
                            //           SizedBox(width: globalWidth / 22),
                            //           Image.asset(
                            //             'assets/png/sqflite-logo.png',
                            //             height: globalHeight / 9,
                            //           ),
                            //           SizedBox(width: globalWidth / 80),
                            //           Image.asset(
                            //             'assets/png/flutter-logo.png',
                            //             height: globalHeight / 7,
                            //           ),
                            //         ],
                            //       ),
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                        SizedBox(
                          height: 70,
                          key: projectKey,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AutoSizeText(
                              'Projects',
                              style: TextStyle(
                                fontFamily: 'poppins-semiBold',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff7127BA),
                              ),
                            ),
                            const AutoSizeText(
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
                                projectImage: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xff2B0B3A),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30.0, top: 30.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset('assets/png/iot.png',
                                          height: 300),
                                    ),
                                  ),
                                ),
                                width: globalWidth * 0.43,
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
                            const AutoSizeText(
                              'Projects',
                              style: TextStyle(
                                fontFamily: 'poppins-semiBold',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff7127BA),
                              ),
                            ),
                            const AutoSizeText(
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
                              liveOnTap: () async {
                                final Uri url = Uri.parse(
                                    'https://play.google.com/store/apps/details?id=com.henkel.DigitalPresenter.Android');
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url,
                                      mode: LaunchMode.externalApplication);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              liveOnTapIos: () async {
                                final Uri url = Uri.parse(
                                    'https://apps.apple.com/in/app/henkel-digital-presenter/id1563799427');
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url,
                                      mode: LaunchMode.externalApplication);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              liveUrl: 'Android mobile app',
                              liveUrlIos: 'Ios mobile app',
                              alignmentImage: Alignment.centerLeft,
                              alignmentContainer: Alignment.centerRight,
                              width: globalWidth * 0.43,
                              projectImage: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff2B0B3A),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 30.0, top: 30.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                        'assets/png/online-merchandisers.png',
                                        height: 300),
                                  ),
                                ),
                              ),
                              technologiesText:
                                  'Flutter, Dart, REST API, Provider(State Management),\nMVVM, Animations.',
                              text:
                                  'Developed a digital application for sales and merchandising teams to view, manage, and present Henkel Beauty Care products across GCC retail stores. The app includes product details, brand visuals, features, benefits, barcodes, and must-stock lists, helping teams ensure brand consistency, planogram compliance, and effective in-store execution. It serves as a reference and presentation tool, enhancing efficiency and accuracy during store visits.',
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AutoSizeText(
                              'Projects',
                              style: TextStyle(
                                fontFamily: 'poppins-semiBold',
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Color(0xff7127BA),
                              ),
                            ),
                            const AutoSizeText(
                              'Zuvonne(Website)',
                              style: TextStyle(
                                fontFamily: 'poppins-semiBold',
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 30),
                            projectContainer(
                              // liveOnTap: () async {
                              //   final Uri url =
                              //       Uri.parse('https://www.zetstron.com/');
                              //   if (await canLaunchUrl(url)) {
                              //     await launchUrl(url,
                              //         mode: LaunchMode.externalApplication);
                              //   } else {
                              //     throw 'Could not launch $url';
                              //   }
                              // },
                              // liveUrl: 'www.zetstron.com',
                              width: globalWidth * 0.43,
                              projectImage: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff2B0B3A),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30.0, top: 30.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset('assets/png/zuvonne.png',
                                        height: 255),
                                  ),
                                ),
                              ),
                              technologiesText: 'Flutter, Dart.',
                              text:
                                  'I have build a responsive website for desktop, tablet, and mobile using the Flutter framework. With a email sending feature, users can easily reach out for inquiries or support. The website is designed to provide a seamless user experience across all devices, ensuring accessibility and engagement for all visitors.',
                            ),
                          ],
                        ),
                        // const SizedBox(height: 50),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.end,
                        //   children: [
                        //     const AutoSizeText(
                        //       'Projects',
                        //       style: TextStyle(
                        //         fontFamily: 'poppins-semiBold',
                        //         fontWeight: FontWeight.w500,
                        //         fontSize: 12,
                        //         color: Color(0xff7127BA),
                        //       ),
                        //     ),
                        //     const AutoSizeText(
                        //       'Henkal Digital Presenter Application',
                        //       style: TextStyle(
                        //         fontFamily: 'poppins-semiBold',
                        //         fontWeight: FontWeight.w500,
                        //         fontSize: 20,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //     const SizedBox(height: 30),
                        //     projectContainer(
                        //         technologiesText:
                        //             'Flutter, Dart, REST API, Provider (State Management), MVVM.',
                        //         text:
                        //             'HDP is a digital presenter application that allows users to create, manage, and present digital content seamlessly. The app provides an intuitive interface for users to organize their presentations, add multimedia elements, and deliver engaging presentations on various devices. With HDP, users can easily share their presentations with others and collaborate in real-time. The app is designed to enhance the presentation experience, making it more interactive and impactful.'),
                        //   ],
                        // ),
                        // const SizedBox(height: 50),
                        const SizedBox(height: 100),

                        AutoSizeText(
                          key: contactKey,
                          'Contact',
                          style: const TextStyle(
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
                            const AutoSizeText(
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
    return Expanded(
      flex: 10,
      child: Container(
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
              Expanded(
                child: AutoSizeText(
                  text,
                  style: const TextStyle(
                    fontFamily: 'poppins-medium',
                    fontSize: 16.5,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget projectContainer({
    required String text,
    required String technologiesText,
    double? width,
    Widget? projectImage,
    String? liveUrl,
    String? liveUrlIos,
    void Function()? liveOnTap,
    void Function()? liveOnTapIos,
    AlignmentGeometry? alignmentImage = Alignment.centerRight,
    AlignmentGeometry? alignmentContainer = Alignment.centerLeft,
  }) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        // Positioned Image Behind
        if (projectImage != null)
          Align(
            alignment: alignmentImage ?? Alignment.centerRight,
            child: projectImage,
          ),

        // Foreground Blurred Glass Container
        Align(
          alignment: alignmentContainer ?? Alignment.centerLeft,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15,
                    children: [
                      AutoSizeText(
                        text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'poppins-medium',
                          fontSize: 16.5,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontFamily: 'poppins-medium',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: 'Technologies Used : $technologiesText ',
                              style: const TextStyle(
                                fontFamily: 'poppins-medium',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Image.asset(
                                'assets/png/arrow_point.png',
                                height: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        spacing: 5,
                        children: [
                          liveUrl != null
                              ? Row(
                                  spacing: 15,
                                  children: [
                                    const AutoSizeText(
                                      'Live :',
                                      style: TextStyle(
                                        fontFamily: 'poppins-medium',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: liveOnTap,
                                      child: AutoSizeText(liveUrl,
                                          style: const TextStyle(
                                            fontFamily: 'poppins-medium',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            overflow: TextOverflow.visible,
                                            decoration:
                                                TextDecoration.underline,
                                          )),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                          liveUrlIos != null
                              ? Row(
                                  spacing: 15,
                                  children: [
                                    const AutoSizeText(
                                      'Live :',
                                      style: TextStyle(
                                        fontFamily: 'poppins-medium',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        overflow: TextOverflow.visible,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: liveOnTapIos,
                                      child: AutoSizeText(liveUrlIos,
                                          style: const TextStyle(
                                            fontFamily: 'poppins-medium',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            overflow: TextOverflow.visible,
                                            decoration:
                                                TextDecoration.underline,
                                          )),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
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

Widget _appBarTitle(
    {required String title,
    required String compare,
    required void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: compare == title ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: AutoSizeText(
          title,
          style: TextStyle(
            fontFamily: 'Preahvihear',
            fontSize: 17.5,
            fontWeight: FontWeight.w400,
            color: compare == title ? Colors.black : Colors.white,
          ),
        ),
      ),
    ),
  );
}
