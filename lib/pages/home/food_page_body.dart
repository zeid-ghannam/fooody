import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooody/utils/colors.dart';
import 'package:fooody/utils/dimensions.dart';
import 'package:fooody/widgets/app_column.dart';
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
  final double _height = Dimensions.pageViewContainer220;

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
        //this section for the slider images
        Container(
          height: Dimensions.pageViewMainContainer320,
          child: PageView.builder(
              itemCount: 5,
              controller: pageController,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        //this is the dot slider
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
        SizedBox(
          height: Dimensions.height30,
        ),
        //Popular Text
        Container(
          margin: EdgeInsets.only(
            left: Dimensions.width25,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: '.',
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              SmallText(
                text: 'Food pairing',
              ),
            ],
          ),
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: Dimensions.height10),
                child: Row(
                  children: [
                    //this container for the image in the listView
                    Container(
                      width: Dimensions.pageViewTextContainer120,
                      height: Dimensions.pageViewTextContainer120,
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/image/food0.png'),
                        ),
                      ),
                    ),
                    //this is the text container in the listView
                    Expanded(
                      child: Container(
                        height: Dimensions.pageViewTextContainer100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            bottomRight: Radius.circular(Dimensions.radius20),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: Dimensions.height10,
                              left: Dimensions.width10,
                              right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              BigText(
                                  text: 'Nutritious fruits meal in China '),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              SmallText(text: 'with chinese characteristics'),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    //this section for doing the scaling page view
    Matrix4 matrix4 = Matrix4.identity();
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
            height: Dimensions.pageViewContainer220,
            margin: EdgeInsets.only(
              left: Dimensions.width10,
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
              height: Dimensions.pageViewTextContainer120,
              margin: EdgeInsets.only(
                left: Dimensions.width25,
                right: Dimensions.width25,
                bottom: Dimensions.height15,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),

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
                padding: EdgeInsets.only(
                    top: Dimensions.height10, left: 15.0, right: 15.0),
                child: AppColumn(text: 'Chinese Side',),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
