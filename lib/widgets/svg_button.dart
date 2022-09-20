import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgButton extends StatelessWidget {
  const SvgButton({
    super.key,
    required this.onPressed,
    required this.svgPath,
    required this.size,
  });
  final VoidCallback onPressed;
  final String svgPath;
  final double size;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      iconSize: size,
      icon: SvgPicture.asset(
        svgPath,
      ),
    );
  }
}
