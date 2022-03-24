import 'package:get/get.dart';


class Dimensions {
  static double screenHeight= Get.context!.height;
  static double screenWeight= Get.context!.width;

  //this is for the page view container
  static double pageViewMainContainer = screenHeight/2.5;
  static double pageViewContainer = screenHeight/3.62;
  static double pageViewTextContainer = screenHeight/6.64;

  //this is for the dynamic height
  static double height10= screenHeight/79.7;
  static double height15= screenHeight/53.1;
  static double height20= screenHeight/39.85;
  static double height25= screenHeight/31.88;
  static double height30= screenHeight/26.56;
  static double height40= screenHeight/19.92;
  static double height45= screenHeight/17.71;

  //this is for the dynamic weight
  static double width10= screenHeight/79.7;
  static double width15= screenHeight/53.1;
  static double width20= screenHeight/39.85;
  static double width25= screenHeight/31.88;
  static double width30= screenHeight/26.56;
  static double width40= screenHeight/19.92;
  static double width45= screenHeight/17.71;

  //this is for the dynamic font
  static double font20= screenHeight/39.85;
  static double font15= screenHeight/53.1;

  //this is for the dynamic radius
  static double radius5= screenHeight/159.4;
  static double radius20= screenHeight/39.85;
  static double radius30= screenHeight/26.56;


}