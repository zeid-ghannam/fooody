import 'package:flutter/material.dart';
import 'package:fooody/utils/colors.dart';
import 'package:fooody/utils/dimensions.dart';
import 'package:fooody/widgets/big_text.dart';
import 'package:fooody/widgets/small_text.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //this show the head of the app that contain the search button and the country and the city
          Container(
            child: Container(
              margin:  EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height15,
              ),
              padding:  EdgeInsets.only(
                left:Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: 'Syria ',
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: 'Tartous',
                            color: Colors.black54,
                          ),
                           Icon(Icons.arrow_drop_down_rounded,size: Dimensions.iconSize25,),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.width45,
                      height: Dimensions.height45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          //this contain the rest of the page 
          Expanded(child: SingleChildScrollView(child: FoodPageBody(),))
        ],
      ),
    );
  }
}
