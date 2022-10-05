import 'package:app_riveepod_example/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

class TitleGenery extends StatelessWidget {
  const TitleGenery({
    Key? key,
    this.text = 'vos catégories',
    this.fontSize = 25,
    this.colorText = Colors.black,
    this.fontWeight = FontWeight.bold,
    this.padding = const EdgeInsets.symmetric(horizontal: paddingH, vertical: 5),
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color colorText;
  final FontWeight fontWeight;
  final EdgeInsets padding;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          color: colorText,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
