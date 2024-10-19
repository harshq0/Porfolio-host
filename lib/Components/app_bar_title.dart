import 'package:flutter/material.dart';

class AppBarTitle extends StatefulWidget {
  final String text;
  final void Function()? onTap;
  final bool isSelected;

  const AppBarTitle({
    super.key,
    this.onTap,
    required this.text,
    required this.isSelected,
  });

  @override
  State<AppBarTitle> createState() => _AppBarTitleState();
}

class _AppBarTitleState extends State<AppBarTitle> {
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
