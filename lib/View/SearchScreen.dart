import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_app/Controller/SearchController.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../Themes/Theme.dart';


class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SearchController controller = Get.put(SearchController()  , permanent:  true );

   var visible = true.obs ;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
         body: Row(
           children: [
             Spacer(flex :1) ,
             Expanded(
               flex : 27 ,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
 
                              GetX<SearchController>(
                                builder:(controller) {
                                 return Visibility
                                (visible : visible.value ,
                                  child: AnimatedContainer(
                                    height: 85.h,
                                    duration: Duration(milliseconds: 300),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox( height : 35.h) ,
                                        AutoSizeText( """Salut,
Bienvenue dans notre magasin ! """, textAlign: TextAlign.start,
                                           style: theme().textTheme.bodyText1?.copyWith(color: Colors.black),),

                                      ],
                                    ),
                                  ),
                                ); }
                              ),
                   SizedBox(height: 20.h,),

                                 Container(
                                   height:56.h ,
                                   width: 401.w ,

                                   child:  TextField(
                                          cursorColor: Colors.black,
                                         decoration: InputDecoration(
                                           prefixIcon: Icon(EvaIcons.search , color:Color(0xff9D9D9D)),
                                           hintText: 'Trouvez votre restaurant, votre produit'  ,
                                           contentPadding: EdgeInsets.symmetric(vertical: 15.h ,),
                                               border: OutlineInputBorder(
                                                   borderRadius: BorderRadius.circular(9.r)  ,
                                                   borderSide: BorderSide.none) ,
                                             filled: true ,
                                             fillColor: Color(0xffE4E4E4),


                                         ),
                                      style: theme().textTheme.bodyText2,
                                      onTap: (){
                                            controller.scroll(visible) ;
                                      },
                                       ),
                                 ),



                                       Expanded(
                                         child: SingleChildScrollView(

                                           physics: BouncingScrollPhysics(),
                                           child: Column (
                                               mainAxisAlignment: MainAxisAlignment.start,
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                             children : [
                                               SizedBox(height: 20.h,) ,
                                               controller.restaurants.length != 0 ? AutoSizeText( 'Restaurant',
                                                   style:theme().textTheme.headline4

                                               ) : Container() ,
                                               SizedBox(height: 10.w,) ,
                                               Container(
                                                 height : 290.h ,
                                                 child: ListView.builder(
                                                     physics: BouncingScrollPhysics(),
                                                     scrollDirection: Axis.horizontal,
                                                     shrinkWrap: true,
                                                     itemCount : controller.restaurants.length,
                                                     itemBuilder:   (contex ,index) => Row(

                                                       mainAxisAlignment: MainAxisAlignment.start,
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: [
                                                         Container(
                                                             height: 310.h ,
                                                             width:398.w ,
                                                             child:
                                                             controller.restaurants[index]
                                                         ),
                                                         SizedBox(width: 10.w,) ,
                                                       ],
                                                     ) ),
                                               ),
                                               SizedBox(height: 20.h,) ,
                                               ListView.builder(
                                                 physics: NeverScrollableScrollPhysics(),
                                                 shrinkWrap: true,
                                                 scrollDirection: Axis.vertical,
                                                 itemCount: controller.food.length,
                                                 itemBuilder: (context , index2) {
                                                   return Column(
                                                     mainAxisAlignment: MainAxisAlignment.start,
                                                     crossAxisAlignment: CrossAxisAlignment.start,

                                                     children: [
                                                       AutoSizeText(controller.food[index2].keys.single,
                                                         style:theme().textTheme.headline4 , textAlign: TextAlign.start,
                                                       ) ,
                                                       SizedBox(height: 10.w,) ,
                                                       Container(
                                                         height : 220.h ,
                                                         child: ListView.builder(
                                                             physics: BouncingScrollPhysics(),
                                                             shrinkWrap: true,
                                                             scrollDirection: Axis.horizontal,
                                                             itemCount  : controller.food[index2].values.single.length,
                                                             itemBuilder: (context , index3) {
                                                               return Row(

                                                                 mainAxisAlignment: MainAxisAlignment.start,
                                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                                 children: [
                                                                   Container(
                                                                     height: 220.h ,
                                                                     width:281.w ,
                                                                     child:
                                                                     controller.food[index2].values.single[index3],
                                                                   ),
                                                                   SizedBox(width: 10.w,) ,
                                                                 ],
                                                               );
                                                             }),
                                                       ) ,
                                                       SizedBox(height: 20.h,) ,
                                                     ],

                                                   ) ;
                                                 } ,

                                               )
                                             ]
                                           ),
                                         ),
                                       ),









                 ],
               ),
             ),
             //Spacer(flex :1) ,
           ],
         ),
      ),
    );
  }

}
