import 'package:flutter/material.dart';
import 'package:fooody/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  SmallText({
    Key? key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 0.0,
    this.height=1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size==0?Dimensions.font13:size,
        fontFamily: 'Roboto',
        height: height,
        fontWeight: FontWeight.w700
      ),
    );
  }
}
