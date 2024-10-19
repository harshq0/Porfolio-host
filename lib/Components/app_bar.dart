import 'package:flutter/material.dart';
import 'package:harish_portfolio/Components/app_bar_title.dart';
import 'package:harish_portfolio/constant.dart';

class AppBarContainer extends StatefulWidget {
  const AppBarContainer({super.key});

  @override
  State<AppBarContainer> createState() => _AppBarContainerState();
}

class _AppBarContainerState extends State<AppBarContainer> {
  String isSelected = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Container(
        height: 100,
        width: globalWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppBarTitle(
                text: 'Home',
                isSelected: isSelected == 'Home',
                onTap: () => setState(() => isSelected = 'Home'),
              ),
              AppBarTitle(
                text: 'Project',
                isSelected: isSelected == 'Project',
                onTap: () => setState(() => isSelected = 'Project'),
              ),
              Row(
                children: [
                  Image.asset('assets/png/flutter.png', height: 50),
                  const Text(
                    'Portfolio',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              AppBarTitle(
                text: 'Resume',
                isSelected: isSelected == 'Resume',
                onTap: () => setState(() => isSelected = 'Resume'),
              ),
              AppBarTitle(
                text: 'About Me',
                isSelected: isSelected == 'About Me',
                onTap: () => setState(() => isSelected = 'About Me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
