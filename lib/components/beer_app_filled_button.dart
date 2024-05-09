import 'package:flutter/material.dart';
import 'package:rate_the_beers/theme/app_theme.dart';

class BeerAppFilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final bool large;
  final Color color;

  const BeerAppFilledButton({
    required this.onPressed,
    required this.child,
    this.color = kAppColor,
    this.large = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(color),
        shape: MaterialStatePropertyAll(kAppBorderRadius),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: large ? 16 : 12,
            horizontal: large ? 32 : 24,
          ),
        ),
      ),
      child: DefaultTextStyle(
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: large ? 20 : 16,
          height: 1.32,
          color: Colors.black,
        ),
        child: child,
      ),
    );
  }
}
