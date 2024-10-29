import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final String? imgSrc;
  final double height;
  final double width;
  const AuthButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.imgSrc,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(
          width,
          height,
        ),
        backgroundColor: Colors.black,
      ),
      onPressed: onPressed,
      label: Text(
        buttonText,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: imgSrc != null
          ? SvgPicture.network(
              imgSrc!,
              width: 24,
              height: 24,
            )
          : const SizedBox.shrink(),
    );
  }
}
