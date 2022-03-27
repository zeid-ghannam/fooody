 import 'package:flutter/cupertino.dart';
import 'package:fooody/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final double size;
    AppIcon({Key? key,required this.icon,
     this.iconColor =const Color(0xff756d54),
     this.backgroundColor = const Color(0xFFfcf4e4),
     this.size =40,
   }) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Container(
       height: size,
       width: size,
       decoration: BoxDecoration(borderRadius: BorderRadius.circular(size/2),
         color: backgroundColor,
         
       ),
      child:
      Icon(icon,color: iconColor,size: Dimensions.iconSize16,),
     );
   }
 }
