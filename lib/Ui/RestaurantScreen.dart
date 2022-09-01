import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_app/Controller/TabBarController.dart';
import 'package:client_app/Ui/CartScreen.dart';
import 'package:client_app/Ui/Food.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Themes/Theme.dart';
import 'Category.dart';

class RestaurantScreen extends StatelessWidget {
  final String image;
  final String name;
  final List<Category> category;
  final String adress;
  final bool state;
   RestaurantScreen({Key? key, required this.image, required this.name, required this.category, required this.adress, required this.state}) : super(key: key);
   var  List_of_food =[].obs;
    List<Food> cart = [] ;
  @override
  Widget build(BuildContext context) {
    TabBarController tab = Get.find() ;

    return
    SafeArea(
        child:  Scaffold(
              floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
              body: Column(
              children: [
                Expanded(
                  flex: 18,
                  child: Stack(
                    children: [
                      Image.asset(
                        'lib/Asset/Images/Restaurant1.png',
                        filterQuality: FilterQuality.high,
                        height: 257.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 10.h,
                        left: 13.w,
                        child: SizedBox(
                          height: 28.h,
                          width: 29.w,
                          child: FloatingActionButton(
                            onPressed: () {
                              Get.back() ;
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 20.sp,
                            ),
                            backgroundColor: Color(0xffDFDFDF),
                          ),
                        ),
                      ),
                      Positioned(
                          left: 7.w,
                          top: 179.h,
                          child: Container(
                            height: 155.h,
                            width: 158.w,
                            child: Center(
                              child: AutoSizeText(
                                name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28.sp,
                                  fontFamily: 'Golos',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffE8B364),
                              border: Border.all(
                                  color: Colors.white,
                                  width: 6.w,
                                  style: BorderStyle.solid),
                            ),
                          )),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Spacer(flex: 1,) ,
                    Expanded(
                       flex: 29,
                        child:   Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                AutoSizeText(
                                  name,
                                  style: TextStyle(
                                      fontFamily: 'Golos',
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.start,
                                ),
                                Row(
                                  children: [
                                    ...List.generate(
                                        category.length,
                                            (index) => Row(
                                          children: [
                                            AutoSizeText(
                                              index == category.length - 1
                                                  ? '${category[index].nom_cat}'
                                                  : '${category[index].nom_cat}-',
                                              style: TextStyle(
                                                  color: Color(0xff9D9D9D),
                                                  fontSize: 13.sp,
                                                  fontFamily: 'Golos'),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 11.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 18.r,
                                      child: Icon(
                                        EvaIcons.mapOutline,
                                        color: state ? Color(0xff669965) : Colors.red,
                                        size: 26.sp,
                                      ),
                                      backgroundColor:
                                      state ? Color(0xffE8F7E5) : Color(0xfff7e5ef),
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                    AutoSizeText(
                                      state ? 'Ouvert' : 'Fermé',
                                      style: TextStyle(
                                          fontFamily: 'Golos',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(
                                      flex: 10,
                                    ),
                                    CircleAvatar(
                                      radius: 18.r,
                                      child: Icon(
                                        EvaIcons.mapOutline,
                                        color: Color(0xffE8B364),
                                        size: 26.sp,
                                      ),
                                      backgroundColor: Color(0xffFCF5E4),
                                    ),
                                    Spacer(
                                      flex: 2,
                                    ),
                                    Expanded(
                                        flex: 86,
                                        child: AutoSizeText(
                                          adress,
                                          style: TextStyle(
                                              fontFamily: 'Golos',
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ],
                                ) ,
                                SizedBox(height: 36.h,) ,
                                Container(

                                  height: 370.h,
                                  width: double.maxFinite,
                                  child: Column (
                                    children: [
                                      TabBar(
                                        controller: tab.tabController,
                                        labelColor: Colors.black,
                                        labelStyle: TextStyle(
                                            fontFamily: 'Golos',
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold

                                        ),
                                        unselectedLabelStyle: TextStyle(
                                      fontFamily: 'Golos',
                                      fontSize: 18.sp,
                                     // fontWeight: FontWeight.bold
                                  ),
                                        indicatorWeight: 2.h,
                                        indicatorColor: Color(0xffE6424B),
                                        indicatorSize: TabBarIndicatorSize.label,
                                        unselectedLabelColor: Color(0xff9D9D9D),
                                        isScrollable: true,

                                        tabs: tab.tabs(category) ,

                                      ) ,
                                      SizedBox(height: 23.h,) ,
                                      Expanded(
                                        child: TabBarView(
                                          controller:tab.tabController ,
                                          children:
                                          [
                                            for(Category cat in category)(
                                            ListView(
                                              physics: BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              children: [
                                                ...List.generate(cat.plat.length,
                                                        (index) => Row(
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                                height: 300.h,
                                                                width: 281.w,
                                                                child: Food(image: cat.plat[index].image, name: cat.plat[index].name, prix: cat.plat[index].prix, List_of_food: List_of_food, description: 'Fromage, Poulet, Sauce Fromage',   )
                                                            ),
                                                            SizedBox(width: 20.w,) ,
                                                          ],
                                                        )
                                                )
                                              ],
                                            )

                                            )  ],

                                        ),
                                      )
                                    ],
                                  ),
                                ) ,
                                //  Spacer(flex: 10,) ,
                                Container(
                                    height: 56.h,
                                    width: 401.w,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.r)),
                                    child:  GetBuilder<TabBarController>(

                                      builder: (controller){
                                        return  ElevatedButton(
                                            style: ElevatedButton.styleFrom(primary: List_of_food.isNotEmpty  ? theme().primaryColor : Color(0xffB8B4B4)),
                                            onPressed: () {
                                              var somme =0.0.obs ;
                                              List<Food> cart = [] ;
                                                  controller.ListOfFood(List_of_food, cart, somme) ;

                                                Get.to(CartScreen(cart: cart, inisial_price: somme.value,)) ;

                                               },
                                            child: AutoSizeText('Continue' ,
                                                style: TextStyle(
                                                    fontFamily: 'Golos',
                                                    fontSize: 22.sp,
                                                    fontWeight: FontWeight.bold),


                                            ));
                                      },


                                    )

                                ) ,
                               // SizedBox(height: 54.h,) ,

                              ],


                        )),
                  ],
                ),
              ],
                )
                        ));




  }
}
