import 'package:get/get.dart';

//this class for put dynamic dimensions for all widget
// to work in all kind of devices even if it small or big
class Dimensions {
  //this for get the height and width of the device using the get package
  static double screenHeight= Get.context!.height;
  static double screenWidth= Get.context!.width;

  //dynamic container size
  static double pageViewMainContainer320 = screenHeight/2.5;
  static double pageViewContainer220 = screenHeight/3.62;
  static double pageViewTextContainer120 = screenHeight/6.64;
  static double pageViewTextContainer100 = screenHeight/7.97;

  // dynamic height
  static double height10= screenHeight/79.7;
  static double height15= screenHeight/53.1;
  static double height20= screenHeight/39.85;
  static double height25= screenHeight/31.88;
  static double height30= screenHeight/26.56;
  static double height40= screenHeight/19.92;
  static double height45= screenHeight/17.71;

  // dynamic width
  static double width5= screenHeight/159.4;
  static double width10= screenHeight/79.7;
  static double width15= screenHeight/53.1;
  static double width20= screenHeight/39.85;
  static double width25= screenHeight/31.88;
  static double width30= screenHeight/26.56;
  static double width40= screenHeight/19.92;
  static double width45= screenHeight/17.71;

  //dynamic font size
  static double font13= screenHeight/61.30;
  static double font15= screenHeight/53.1;
  static double font20= screenHeight/39.85;
  static double font26= screenHeight/30.65;

  //radius dynamic size
  static double radius5= screenHeight/159.4;
  static double radius15= screenHeight/53.13;
  static double radius20= screenHeight/39.85;
  static double radius30= screenHeight/26.56;
  // Icon dynamic size
  static double iconSize16=screenHeight/49.8;
  static double iconSize20=screenHeight/39.85;
  static double iconSize26=screenHeight/30.65;

  // Popular food page

  static double popularFoodImg= screenHeight/2.5;
  //bottom height
  static double bottomHeightBar=screenHeight/6.64;



}