import 'package:flutter/material.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({
    super.key,
    required this.logo,
    required this.onPressed,
  });

  final String logo;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 30,
          width: 30,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Image.asset(logo),
            ),
          ),
        ),
      ),
    );
  }
}
