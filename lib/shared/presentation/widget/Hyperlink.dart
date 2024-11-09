import 'package:flutter/material.dart';

class Hyperlink extends StatelessWidget {
  const Hyperlink(
      {super.key, required this.onTap,
        required this.text,
        this.fontSize = 17,
        this.color = Colors.red,
        this.decorationColor = Colors.red
      });

  final onTap;
  final String text;
  final double fontSize;
  final color;
  final decorationColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: fontSize,
          color: color,
          decoration: TextDecoration.underline,
          decorationColor: decorationColor,
        ),
      ),
    );
  }
}
