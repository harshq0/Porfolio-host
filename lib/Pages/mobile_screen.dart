import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:harish_portfolio/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  bool isHover = false;
  bool isFocusHover = false;
  Offset mousePosition = Offset.zero;
  String isSelected = 'Home';
  final ScrollController _scrollController = ScrollController();
  double topTextOpacity = 1.0;

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      double newOpacity = 1.0 - (offset / 200);
      newOpacity = newOpacity.clamp(0.0, 1.0);

      setState(() {
        topTextOpacity = newOpacity;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    globalHeight = MediaQuery.of(context).size.height;
    globalWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: MouseRegion(
          onEnter: (event) => setState(() => isFocusHover = true),
          onExit: (event) => setState(() => isFocusHover = false),
          onHover: (event) {
            final RenderBox box = context.findRenderObject() as RenderBox;
            final localPosition = box.globalToLocal(event.position);

            setState(() {
              mousePosition = Offset(
                localPosition.dx / box.size.width,
                localPosition.dy / box.size.height,
              );
            });
          },
          child: Container(
            decoration: isFocusHover
                ? BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(
                        (mousePosition.dx - 0.5) * 2,
                        (mousePosition.dy - 0.5) * 2,
                      ),
                      colors: const [
                        Colors.deepPurple,
                        Colors.transparent,
                        Colors.transparent,
                      ],
                      radius: 1.5,
                    ),
                  )
                : null,
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white12),
                            borderRadius: BorderRadius.circular(400),
                            boxShadow: const [
                              BoxShadow(
                                // color: Colors.white,
                                blurRadius: 40,
                                blurStyle: BlurStyle.outer,
                                offset: Offset(0, 0),
                              )
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(400),
                            child: Image.asset(
                              'assets/png/flutter.png',
                              fit: BoxFit.contain,
                              height: 150,
                              width: 150,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const AutoSizeText(
                          "I'm Harish.P",
                          style: TextStyle(
                            fontFamily: 'inter-bold',
                            fontWeight: FontWeight.w600,
                            fontSize: 45,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              "Flutter Developer",
                              speed: const Duration(milliseconds: 200),
                              textStyle: const TextStyle(
                                  fontFamily: 'inter-medium',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                          ],
                        ),
                        const SizedBox(height: 60),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            HoverAppBarButton(
                                onTap: () =>
                                    _launchURL('https://github.com/harshq0'),
                                text: '',
                                imagePath: 'assets/png/github.png'),
                            HoverAppBarButton(
                                onTap: () => _launchURL(
                                    'https://www.linkedin.com/in/harish-panneer/'),
                                text: '',
                                imagePath: 'assets/png/linkedin.png'),
                            const HoverAppBarButton(
                                text: '', imagePath: 'assets/png/resume.png'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    const AutoSizeText(
                      "Passionate Flutter developer with a strong foundation in Flutter and Dart. Skilled in building clean architecture and eager to learn and explore new technologies quickly, contributing to both personal growth and the success of the company.",
                      style: TextStyle(
                        wordSpacing: 3,
                        fontFamily: 'inter-medium',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 40),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'Work Experience',
                          style: TextStyle(
                            fontFamily: 'inter-extraBold',
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),

                    const AutoSizeText(
                      'Lentera Technologies Pvt. Ltd.',
                      style: TextStyle(
                        fontFamily: 'inter-semiBold',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const AutoSizeText(
                      'Flutter Developer',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'inter-medium',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    descriptionPoints(
                        text:
                            'Developed and maintained cross-platform mobile applications using Flutter and Dart'),

                    descriptionPoints(
                        text:
                            'Implemented REST API integrations to support real-time data flow and enhance appresponsiveness.'),

                    descriptionPoints(
                        text:
                            'Integrated FCM (Firebase Cloud Messaging) for push notifications and real-time alerts.'),

                    descriptionPoints(
                        text:
                            'Collaborated with cross-functional teams including backend developers, UI/UX designers.'),

                    descriptionPoints(
                        text:
                            'Focused on performance optimization, error handling, and smooth UI transitions.'),

                    const SizedBox(height: 25),
                    const AutoSizeText(
                      'Projects',
                      style: TextStyle(
                        fontFamily: 'inter-extraBold',
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const AutoSizeText(
                      'Zymra IOT Application',
                      style: TextStyle(
                        fontFamily: 'inter-semiBold',
                        color: Colors.deepPurple,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    descriptionPoints(
                        text:
                            'In a real-time project as a Flutter developer, I faced several challenges while working on a live application. These included debugging complex issues, integrating APIs for the first time, and handling unexpected runtime errors. However, I was eager to learn, and through consistent effort, I successfully overcame these challenges. This experience helped me grow technically and taught me how to work effectively in a real-world development environment.'),
                    descriptionPoints(
                        text:
                            'In this project, my role was to develop both the installer and customer applications using Flutter. I collaborated closely with the UI/UX design team and the backend development team to ensure smooth integration and user experience. Throughout the project, I gained hands-on experience in file management, creating custom widgets, implementing Provider state management, integrating FCM (Firebase Cloud Messaging) for push notifications, and setting up Razorpay for payment processing.'),

                    const SizedBox(height: 25),
                    const AutoSizeText(
                      'HDP (Henkel Digital Presenter)',
                      style: TextStyle(
                        fontFamily: 'inter-semiBold',
                        color: Colors.deepPurple,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    descriptionPoints(
                        text:
                            "A mobile application designed for Henkel Beauty Care’s GCC region to help sales representatives and merchandisers access key product details such as brand KV, positioning, features, benefits, barcodes, country of origin, and must-stock lists for effective in-store management."),
                    descriptionPoints(
                        text:
                            'Through this application, I gained experience in building responsive designs and implementing smooth animations and transitions. I worked on CRUD operations in collaboration with the backend team and learned how to apply the MVVM architecture using the Provider state management approach.'),
                    const SizedBox(height: 25),

                    // const AutoSizeText(
                    //   'Ticketzee',
                    //   style: TextStyle(
                    //     fontFamily: 'inter-semiBold',
                    //     color: Colors.deepPurple,
                    //     fontSize: 22,fF
                    //     fontWeight: FontWeight.w600,
                    //   ),
                    // ),
                    // const SizedBox(height: 5),

                    const AutoSizeText(
                      'Studies',
                      style: TextStyle(
                        fontFamily: 'inter-extraBold',
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const AutoSizeText(
                      'SRM Valliammai Engineering College',
                      style: TextStyle(
                        fontFamily: 'inter-semiBold',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const AutoSizeText(
                      'BE in Computer Engineering',
                      style: TextStyle(
                        fontFamily: 'inter-regular',
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const AutoSizeText(
                      'Technical Skills',
                      style: TextStyle(
                        fontFamily: 'inter-extraBold',
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _technicalSkill(
                        imagePath: 'assets/png/flutter-logo.png',
                        text: 'Flutter'),
                    const SizedBox(height: 5),
                    const Text(
                      'Cross Platform Mobile Apps, Provider, MVVM Architecture, Animation, REST API, SQFLite, Custom Widget Building.',
                      style: TextStyle(
                        fontFamily: 'inter-regular',
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _technicalSkill(
                        imagePath: 'assets/png/dart-logo.png', text: 'Dart'),
                    const SizedBox(height: 5),
                    const Text(
                      'Solid understanding of programming languages in Dart, Object-Oriented Programming (OOP), Null Safety, Asynchronous Programming.',
                      style: TextStyle(
                        fontFamily: 'inter-regular',
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 15),
                    _technicalSkill(
                        imagePath: 'assets/png/firebase-logo.png',
                        text: 'Firebase'),
                    const SizedBox(height: 5),
                    const Text(
                      'Authentication, Cloud Firestore, Realtime Database, Cloud Messaging (FCM).',
                      style: TextStyle(
                        fontFamily: 'inter-regular',
                        fontSize: 17,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const AutoSizeText(
                      'Contact Me',
                      style: TextStyle(
                        fontFamily: 'inter-extraBold',
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      spacing: 6,
                      children: [
                        Image.asset(
                          'assets/png/phone.png',
                          color: Colors.white,
                          height: 20,
                        ),
                        const AutoSizeText(
                          '9361045110',
                          style: TextStyle(
                            fontFamily: 'inter-bold',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      spacing: 6,
                      children: [
                        Image.asset(
                          'assets/png/mail.png',
                          color: Colors.white,
                          height: 20,
                        ),
                        const AutoSizeText(
                          'harishselvampanneer@gmail.com',
                          style: TextStyle(
                            fontFamily: 'inter-bold',
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _technicalSkill({required String imagePath, required String text}) {
    return Row(
      spacing: 10,
      children: [
        imagePath != ''
            ? Image.asset(
                imagePath,
                height: 20,
              )
            : const SizedBox(),
        AutoSizeText(
          text,
          style: const TextStyle(
            fontFamily: 'inter-bold',
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget descriptionPoints({required String text}) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: '.',
            style: TextStyle(
              color: Colors.deepPurple,
              fontFamily: 'inter-bold',
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
          const WidgetSpan(child: SizedBox(width: 10)),
          TextSpan(
            text: text,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'inter-medium',
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.5),
          ),
        ],
      ),
    );
  }
}

class HoverAppBarButton extends StatefulWidget {
  final String text;
  final String imagePath;
  final void Function()? onTap;

  const HoverAppBarButton({
    super.key,
    required this.text,
    required this.imagePath,
    this.onTap,
  });

  @override
  State<HoverAppBarButton> createState() => _HoverAppBarButtonState();
}

class _HoverAppBarButtonState extends State<HoverAppBarButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) {
          setState(() => isHover = true);
        },
        onExit: (event) {
          setState(() => isHover = false);
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                blurRadius: 40,
                blurStyle: BlurStyle.outer,
                offset: Offset(0, 0),
              )
            ],
            border: Border.all(color: Colors.white12),
            color: isHover ? Colors.white10 : Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Image.asset(
              widget.imagePath,
              color: Colors.white,
              height: 20,
            ),
          ),
        ),
      ),
    );
  }
}
