import 'dart:core';
import 'package:client_app/Controller/RestaurantScreen_controller.dart';
import 'package:client_app/Themes/Theme.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Controller/RestaurantController.dart';
import '../Controller/TabBarController.dart';
import 'Category.dart';

import 'OpenTime.dart';
import 'RestaurantScreen.dart';

class Restaurant extends StatelessWidget {
 final String image ;
 final String name ;
 final RxList<Category> category ;
 final String adress ;
 final bool   state ;
 final OpenTime openTime ;
 Restaurant({Key? key, required this.image, required this.name, required this.category, required this.adress, required this.state, required this.openTime,  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var time = DateTime.now().obs ;
    var isOpened = ( time.value.hour < openTime.openHour.hour  || time.value.hour > openTime.closeHour.hour || (time.value.hour == openTime.openHour.hour && time.value.minute < openTime.openHour.minute) || (time.value.hour == openTime.closeHour.hour && time.value.minute > openTime.closeHour.minute) ) ? false.obs : true.obs ;
    RestaurantController controller = Get.find() ;
    controller.time_change_detector( openTime, isOpened) ;

    return
        InkWell(
          onTap: (){
            RestaurantScreen_controller tab = Get.put(RestaurantScreen_controller() , permanent: true ) ;
            tab.inisialize(category.length , 0) ;

            Get.to( ()=> RestaurantScreen(image: image, name: name, category: category, adress: adress, state: state, openTime: OpenTime(TimeOfDay(hour: 23, minute:32), TimeOfDay(hour:21, minute: 46)),)
          );

          },
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 174.h ,
                width:398.w ,
                decoration : BoxDecoration(
                  image : DecorationImage(image: AssetImage(image) , fit: BoxFit.cover ) ,
                  borderRadius: BorderRadius.circular(9.r) ,

                )
              ) ,
              SizedBox(height: 10.h,) ,
              AutoSizeText(name ,
                style: theme().textTheme.headline4 ,
                textAlign: TextAlign.start,) ,
               Row(children: [
                 ...List.generate(category.length, (index) => Row(
                   children: [
                       AutoSizeText( index == category.length-1 ?'${category[index].nom_cat}' :'${category[index].nom_cat}-' ,
                         style: theme().textTheme.subtitle1?.copyWith(color: Color(0xff9D9D9D) , fontWeight: FontWeight.normal) ,
                       ),
                   ],
                 )) ,
               ],),

             SizedBox(height: 10.h,) ,
              Obx( () {
                return Row(
                  crossAxisAlignment:CrossAxisAlignment.center ,
                  children: [
                    CircleAvatar( radius: 18.r,
                      child:Icon(EvaIcons.mapOutline , color:   isOpened.value ?Color(0xff669965) : Colors.red, size: 26.sp,) ,
                      backgroundColor: isOpened.value ? Color(0xffE8F7E5) : Color(0xfff7e5ef),) ,

                    Spacer(flex: 2,) ,

                    AutoSizeText(isOpened.value ? 'Ouvert' : 'Fermé' ,
                        style : theme().textTheme.bodyText2
                    ),

                    Spacer(flex: 10,) ,

                    CircleAvatar( radius: 18.r,
                      child:Icon(EvaIcons.mapOutline , color: Color(0xffE8B364), size: 26.sp,) ,
                      backgroundColor: Color(0xffFCF5E4),) ,
                    Spacer(flex: 2,) ,
                    Expanded(
                        flex: 86,
                        child: AutoSizeText(adress ,
                            style : theme().textTheme.bodyText2
                        )
                    ),
                  ],
                ) ;
              }) ,

            ],
          ),
        );
  }
}
