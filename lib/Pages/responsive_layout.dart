import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget tablet;
  const ResponsiveLayout(
      {super.key,
      required this.mobile,
      required this.desktop,
      required this.tablet});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobile;
        } else if (constraints.maxWidth >= 600 && constraints.maxWidth < 1024) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
