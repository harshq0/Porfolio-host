import 'package:flutter/material.dart';
import 'package:harish_portfolio/constant.dart';

class AppBarContainer extends StatefulWidget {
  final void Function(String)? ontap;
  final String title;
  const AppBarContainer({
    super.key,
    required this.ontap,
    required this.title,
  });

  @override
  State<AppBarContainer> createState() => _AppBarContainerState();
}

class _AppBarContainerState extends State<AppBarContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Container(
        height: 100,
        width: globalWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.transparent,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white30,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/png/home.png',
                        color: Colors.white,
                        height: 20,
                      ),
                      const Text(
                        'Home',
                        style: TextStyle(
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
              // HoverAppBarButton(
              //   text: 'Home',
              //   isSelected: widget.title == 'Home',
              //   onTap: () => widget.ontap?.call('Home'),
              // ),
              // HoverAppBarButton(
              //   text: 'Project',
              //   isSelected: widget.title == 'Project',
              //   onTap: () => widget.ontap?.call('Project'),
              // ),
              // Row(
              //   children: [
              //     Image.asset('assets/png/flutter.png', height: 50),
              //     const Text(
              //       'Portfolio',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 20,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ],
              // ),
              // HoverAppBarButton(
              //   text: 'Resume',
              //   isSelected: widget.title == 'Resume',
              //   onTap: () => widget.ontap?.call('Resume'),
              // ),
              // HoverAppBarButton(
              //   text: 'About Me',
              //   isSelected: widget.title == 'About Me',
              //   onTap: () => widget.ontap?.call('About Me'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class HoverAppBarButton extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;

  const HoverAppBarButton({
    super.key,
    required this.text,
    required this.isSelected,
    this.onTap,
  });

  @override
  State<HoverAppBarButton> createState() => _HoverAppBarButtonState();
}

class _HoverAppBarButtonState extends State<HoverAppBarButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 50,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: (widget.isSelected || isHover)
                ? Colors.white
                : Colors.transparent,
          ),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: (widget.isSelected || isHover)
                    ? Colors.black
                    : Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
