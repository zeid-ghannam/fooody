
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fooody/utils/colors.dart';
import 'package:fooody/utils/dimensions.dart';
import 'package:fooody/widgets/big_text.dart';
import 'package:fooody/widgets/icon_and_text_widget.dart';
import 'package:fooody/widgets/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //this container hold the first section from the screen that has the page view builder
    return Column(
      children: [
        Container(
          height: Dimensions.pageViewMainContainer,
          child: PageView.builder(
              itemCount: 5,
              controller: pageController,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.radius5)),
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    //this section for doing the scaling page view
    Matrix4 matrix4 =  Matrix4.identity();
    //this for the current page view in the slider
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
      // this for the next page view in the slider
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
      // this is for the previous page view in the slider
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
      // this is for the rest cases
    } else {
      var currScale = 0.8;
      var currTrans = _height * (1 - currScale) / 2;
      matrix4 = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    return Transform(
      transform: matrix4,
      child: Stack(
        children: [
          //this container have the image for the food in the stack
          Container(
            height: Dimensions.pageViewContainer,
            margin:  EdgeInsets.only(
              left:Dimensions.width10,
              right: Dimensions.width10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              image: const DecorationImage(
                image: AssetImage('assets/image/food0.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            //this is the bottom container which has the rest of the information
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin:  EdgeInsets.only(
                left: Dimensions.width25,
                right: Dimensions.width25,
                bottom: Dimensions.height15,
              ),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),

                  //this for making the shadow in the bottom container
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5, 0),
                    ),
                  ]),
              child: Padding(
                padding:
                     EdgeInsets.only(top: Dimensions.height10, left: 15.0, right: 15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(text: 'Chinese Side'),
                       SizedBox(
                        height: Dimensions.height10,
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                              5,
                              (index) => Icon(
                                Icons.star,
                                color: AppColors.mainColor,
                                size: Dimensions.height15,
                              ),
                            ),
                          ),
                           SizedBox(
                            width: Dimensions.width15,
                          ),
                          SmallText(text: '4.5 '),
                           SizedBox(
                             width:Dimensions.width15 ,
                          ),
                          SmallText(text: '1287 comment'),
                        ],
                      ),
                       SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconAndTextWidget(
                            icon: Icons.circle_sharp,
                            iconColor: AppColors.iconColor1,
                            text: 'Normal',
                          ),

                          IconAndTextWidget(
                            icon: Icons.location_on,
                            iconColor: AppColors.mainColor,
                            text: '1.7km',
                          ),

                          IconAndTextWidget(
                            icon: Icons.access_time_rounded,
                            iconColor: AppColors.iconColor2,
                            text: '32min',
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
