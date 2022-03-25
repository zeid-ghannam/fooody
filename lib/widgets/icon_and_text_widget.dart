import 'package:flutter/material.dart';
import 'package:fooody/utils/dimensions.dart';
import 'package:fooody/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;

  final String text;
  final Color iconColor;

  const IconAndTextWidget({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconSize25,
        ),
        SizedBox(
          width: Dimensions.width5,
        ),
        SmallText(
          text: text,
        ),
      ],
    );
  }
}
