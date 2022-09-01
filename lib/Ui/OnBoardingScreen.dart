import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_app/Controller/AppController.dart';
import 'package:client_app/Themes/Theme.dart';
import 'package:client_app/Ui/Dots.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'OnBoardContent.dart';
import 'SearchScreen.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body :  GetBuilder<AppController> (
             init: AppController(),
            builder: ((controller) =>
        Column(
          children: [

            Expanded(
              child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  onPageChanged: controller.onchange ,
                  controller: controller.controller,
                  itemCount: controller.pages.length,
                  itemBuilder: (context, index) =>
                      OnBoardContent(description: controller.pages[index].description,
                        title: controller.pages[index].title, image: controller.pages[index].image,)),
            ),
            SizedBox(height : 32.h) ,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(controller.pages.length, (index) => Row(
                  children: [
                    Dots(isActive: index==controller.page_index),
                    SizedBox(width: 6.w,),
                  ],
                )),

              ],
            ) ,
            SizedBox(height: 32.h,) ,
            Container(
              height: 56.h,
              width: 401.w,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.r)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: theme().primaryColor ),
                  onPressed: () {

                 Get.to(() => SearchScreen()) ;
                  ; },
                  child: AutoSizeText('Continue' , style: Theme.of(context).textTheme.headline6,)),
            ) ,
            SizedBox(height: 84.h,) ,

          ],
        )))
    );
  }
}
