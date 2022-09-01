import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_app/Controller/AppController.dart';
import 'package:client_app/Controller/TabBarController.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
   AppController controller = Get.put(AppController()  , permanent:  true );
   TabBarController tab = Get.put(TabBarController() , permanent: true ) ;
   List <List> search = [ controller.restaurants , controller.Pizza];
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
         body: Row(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Spacer(flex: 1,) ,
             Expanded(
               flex: 29,
               child: Column(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                     children : [
                           Spacer(flex: 2, ) ,
                           AutoSizeText( """Salut,
Bienvenue dans notre magasin ! """,
                             style: TextStyle(fontFamily: 'Golos' , fontSize: 15.sp , ),),
                           Spacer(flex: 6,) ,
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

                                 ),
                           ),
                           Spacer(flex: 4) ,
                           Expanded(
                             flex: 90,
                             child: ListView(
                               children: [
                                 ...List.generate(search.length, (index) => Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     AutoSizeText('Restaurant' , style:
                                     TextStyle(fontFamily: 'Golos' , fontSize: 18.sp ,fontWeight: FontWeight.bold ), ) ,
                                     SizedBox(height: 10.w,) ,
                                     Container(
                                       height: 300.h,
                                       width: double.maxFinite,
                                       child: ListView(
                                         physics: BouncingScrollPhysics(),
                                         scrollDirection: Axis.horizontal,
                                         children: [

                                           ...List.generate(search[index].length, (index2) => Row(
                                             mainAxisAlignment: MainAxisAlignment.start,
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               Container(
                                                   height: 300.h,
                                                   width: 281.w,
                                                   child:
                                                  search[index][index2]
                                                  ),
                                               SizedBox(width: 10.w,) ,
                                             ],
                                           ) ) ,
                                         ],
                                       ),
                                     ),
                                     SizedBox(height: 30.h,),
                                   ],
                                 )
                                 )
                               ],
                             ),
                           ) ,


                     ],


               ),
             ),
             Spacer(flex: 1,),
           ],
         ),
      ),
    );
  }
}
