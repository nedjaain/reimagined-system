import 'dart:core';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Controller/TabBarController.dart';
import 'Category.dart';
import 'RestaurantScreen.dart';

class Restaurant extends StatelessWidget {
 final String image ;
 final String name ;
 final List<Category> category ;
 final String adress ;
 final bool   state ;
 Restaurant({Key? key, required this.image, required this.name, required this.category, required this.adress, required this.state}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return
        InkWell(
          onTap: (){
            TabBarController tab = Get.put(TabBarController() , permanent: true ) ;
            tab.inisialize(category.length) ;

            Get.to( ()=> RestaurantScreen(image: image, name: name, category: category, adress: adress, state: state)
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 164.h ,
                width:398.w ,
                decoration : BoxDecoration(
                  image : DecorationImage(image: AssetImage(image) , fit: BoxFit.cover ) ,
                  borderRadius: BorderRadius.circular(9.r) ,

                )
              ) ,
              SizedBox(height: 10.h,) ,
              AutoSizeText(name , style: TextStyle(fontFamily: 'Golos' , fontSize: 18.sp ,fontWeight: FontWeight.bold ), textAlign: TextAlign.start,) ,
               Row(children: [
                 ...List.generate(category.length, (index) => Row(
                   children: [
                       AutoSizeText( index == category.length-1 ?'${category[index].nom_cat}-' :'${category[index].nom_cat}-' , style: TextStyle(color: Color(0xff9D9D9D),
                        fontSize: 13.sp , fontFamily: 'Golos'),),
                   ],
                 )) ,
               ],),

              SizedBox(height: 11.h,) ,
              Row(
                crossAxisAlignment:CrossAxisAlignment.center ,
                children: [
                  CircleAvatar( radius: 18.r,
                     child:Icon(EvaIcons.mapOutline , color:   state ?Color(0xff669965) : Colors.red, size: 26.sp,) ,
                     backgroundColor: state ? Color(0xffE8F7E5) : Color(0xfff7e5ef),) ,

                  Spacer(flex: 2,) ,

                  AutoSizeText(state ? 'Ouvert' : 'Fermé' , style : TextStyle(fontFamily: 'Golos' , fontSize: 14.sp ,fontWeight: FontWeight.bold ),),

                  Spacer(flex: 10,) ,

                  CircleAvatar( radius: 18.r,
                    child:Icon(EvaIcons.mapOutline , color: Color(0xffE8B364), size: 26.sp,) ,
                    backgroundColor: Color(0xffFCF5E4),) ,
                  Spacer(flex: 2,) ,
                  Expanded(
                    flex: 86,
                      child: AutoSizeText(adress , style : TextStyle(fontFamily: 'Golos' , fontSize: 14.sp ,fontWeight: FontWeight.bold ), )
                  ),
                ],
              )
            ],
          ),
        );
  }
}
