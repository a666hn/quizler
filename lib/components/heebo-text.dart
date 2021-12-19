import 'package:flutter/material.dart';

class HeeboText extends StatelessWidget {
  const HeeboText(this.text, {Key? key, this.color, this.shades})
      : super(key: key);

  final String text;
  final Color? color;
  final int? shades;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Heebo',
      ),
    );
  }
}
