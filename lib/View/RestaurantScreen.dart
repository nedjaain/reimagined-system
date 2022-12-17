import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_app/Controller/RestaurantScreen_controller.dart';
import 'package:client_app/View/CartScreen.dart';
import 'package:client_app/View/Food.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Controller/FoodController.dart';
import '../Themes/Theme.dart';
import 'Category.dart';
import 'package:shimmer/shimmer.dart';
import 'OpenTime.dart';

class RestaurantScreen extends StatelessWidget {
  final String image;
  final String name;
   RxList<Category> category ;
  final String adress;
  final bool state;
  final OpenTime openTime ;

   RestaurantScreen({Key? key, required this.image, required this.name, required this.category, required this.adress, required this.state, required this.openTime,}) : super(key: key);
   RxList <Food>  List_of_food =<Food>[].obs;

  RestaurantScreen_controller controller = Get.put(RestaurantScreen_controller() ) ;

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now().obs ;
    var isOpened = ( time.value.hour < openTime.openHour.hour  || time.value.hour > openTime.closeHour.hour || (time.value.hour == openTime.openHour.hour && time.value.minute < openTime.openHour.minute) || (time.value.hour == openTime.closeHour.hour && time.value.minute > openTime.closeHour.minute) ) ? false.obs : true.obs ;

    controller.time_change_detector( openTime, isOpened) ;
    return
      SafeArea(
        child:  Scaffold(
              floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
              body:

                  WillPopScope(

                    onWillPop:  () async => false,
                    child: GetBuilder<RestaurantScreen_controller> (

                        builder: (controller){
                      return controller.is_loaded ?
                      Column(
                        children: [
                          Expanded(
                            flex: 18,
                            child: Stack(
                              children: [
                                Image.asset(
                                  image,
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
                                        controller.Reinitialize(category) ;
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
                                          style: theme().textTheme.headline1?.copyWith(color: Colors.white) ,
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                        style:theme().textTheme.headline4 ,
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
                                                    style: theme().textTheme.subtitle1?.copyWith(color: Color(0xff9D9D9D) , fontWeight: FontWeight.normal) ,
                                                  ),
                                                ],
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 11.h,
                                      ),
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

                                      SizedBox(height: 36.h,) ,
                                      Container(

                                        height: 370.h,
                                        width: double.maxFinite,
                                        child: Column (
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TabBar(

                                              controller: controller.tabController,
                                              physics: BouncingScrollPhysics(),
                                              labelColor: Colors.black,
                                              labelStyle: theme().textTheme.headline4 ,
                                              unselectedLabelStyle: theme().textTheme.headline4 ,
                                              indicator :UnderlineTabIndicator (
                                                    borderSide: BorderSide(
                                                      width : 2.h ,
                                                      color :Color(0xffE6424B)

                                                    ) ,
                                                insets: EdgeInsets.only(left: 0 ,right :30.w ,)
                                                       ),
                                              unselectedLabelColor: Color(0xff9D9D9D),
                                              isScrollable: true,

                                              labelPadding: EdgeInsets.only(left: 0 , right : 30.w),
                                              tabs: controller.tabs(category) ,

                                            ) ,
                                            SizedBox(height: 23.h,) ,
                                            Expanded(
                                              child:

                                                    TabBarView(
                                                  controller:controller.tabController ,
                                                  children:
                                                  [
                                                    for(Category cat in category)(
                                                     ListView(
                                                          physics: BouncingScrollPhysics(),
                                                          scrollDirection: Axis.horizontal,
                                                          addAutomaticKeepAlives: true,
                                                          children: [
                                                            ...List.generate(cat.plat.length,
                                                                    (index) =>
                                                                        Row(
                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [

                                                                    Container(
                                                                        height: 300.h,
                                                                        width: 281.w,
                                                                        child: Food(image: cat.plat[index].image, name: cat.plat[index].name, prix: cat.plat[index].prix, List_of_food: List_of_food, description: 'Fromage, Poulet, Sauce Fromage', ajouter: cat.plat[index].ajouter, )
                                                                    ),
                                                                    SizedBox(width: 20.w,) ,
                                                                  ],
                                                                )
                                                            )
                                                          ],
                                                        )

                                                    )  ],

                                                )
                                              ),

                                          ],
                                        ),
                                      ) ,
                                      //  Spacer(flex: 10,) ,
                                      Container(
                                          height: 56.h,
                                          width: 401.w,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.r)),
                                          child:  GetX<RestaurantScreen_controller>(

                                            builder: (ctr){
                                              return  ElevatedButton(

                                                  style: ElevatedButton.styleFrom(primary: List_of_food.isNotEmpty  ? theme().primaryColor : Color(0xffB8B4B4) ,shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(9.0),
                                                      side: BorderSide(color: Colors.red))),
                                                  onPressed: List_of_food.isEmpty ? () { } : () {
                                                    var somme =0.0.obs ;
                                                    print(List_of_food[0].ajouter) ;
                                                    ctr.ListOfFood(List_of_food, somme) ;

                                                    Get.to(()=>CartScreen(cart: List_of_food, inisial_price: somme.value, category: category,)) ;

                                                  },
                                                  child: AutoSizeText('Continue' ,
                                                    style: theme().textTheme.headline2
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
                      ) : Restaurant_Shimmer() ;
                    }),
                  )

                        )) ;




  }
  Widget Restaurant_Shimmer (  ){
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      period: Duration(seconds: 3),
      child: Column(
        children: [
          Expanded(
            flex: 18,
            child: Stack(
              children: [
                Container(
                  height: 257.h,
                  width: double.infinity,
                  color : Colors.white ,
                ) ,
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
                      width: 158.w ,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color : Colors.white ,
                        border: Border.all(
                            color: Colors.white,
                            width: 6.w,
                            style: BorderStyle.solid),
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            flex : 27 ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(flex: 1,) ,
                Expanded(
                    flex: 29,
                    child:   Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                            height : 20.h ,
                            width: 150.w,
                            decoration : BoxDecoration(
                              color : Colors.white ,
                              borderRadius: BorderRadius.circular(9.r) ,

                            )
                        ),
                        SizedBox(height: 10.h,) ,
                        Row(
                                  children: [
                                    Container(
                                        height : 20.h ,
                                        width: 250.w,
                                        decoration : BoxDecoration(
                                          color : Colors.white ,
                                          borderRadius: BorderRadius.circular(9.r) ,

                                        )
                                    ),


                          ],
                        ),
                        SizedBox(
                          height: 11.h,
                        ),
                        Row(
                          crossAxisAlignment:CrossAxisAlignment.center ,
                          children: [
                            Container(
                                height: 20.h,
                                width: 150.w,
                                decoration : BoxDecoration(
                                  color : Colors.white ,
                                  borderRadius: BorderRadius.circular(9.r) ,

                                )
                            ),
                            SizedBox(width: 8.w,) ,
                            Expanded(
                              child: Container(
                                  height: 20.h,

                                  decoration : BoxDecoration(
                                    color : Colors.white ,
                                    borderRadius: BorderRadius.circular(9.r) ,

                                  )
                              ),
                            ),
                            SizedBox(width: 8.w,) ,

                          ],
                        ) ,
                        SizedBox(height: 56.h,) ,
                        Container(

                          height: 370.h,
                          width: double.maxFinite,
                          child: Column (
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ...List.generate(4, (index) =>
                                      Row(

                                        children : [
                                          Container(
                                            height: 28.h,
                                            width: 90.w,
                                              decoration : BoxDecoration(
                                                color : Colors.white ,
                                                borderRadius: BorderRadius.circular(9.r) ,

                                              )
                                          ) ,
                                          SizedBox(width: 10.w,) ,
                                        ]
                                      )
                                  )
                                ],
                              ),

                              SizedBox(height: 23.h,) ,
                              Expanded(
                                child: ListView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    ...List.generate(2,
                                            (index) => Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                height: 300.h,
                                                width: 281.w,
                                                child:
                                                Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        height: 161.h ,
                                                        width:281.w ,
                                                        decoration : BoxDecoration(
                                                          color : Colors.white ,
                                                          borderRadius: BorderRadius.circular(9.r) ,

                                                        )
                                                    ) ,
                                                    SizedBox(height: 10.h,) ,
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Container(
                                                                  height: 20.h,
                                                                  width: 150.w,
                                                                  decoration : BoxDecoration(
                                                                    color : Colors.white ,
                                                                    borderRadius: BorderRadius.circular(9.r) ,

                                                                  )
                                                              ),
                                                              SizedBox(height: 5.h,) ,
                                                              Container(
                                                                  height: 20.h,
                                                                  width: 80.w,
                                                                  decoration : BoxDecoration(
                                                                    color : Colors.white ,
                                                                    borderRadius: BorderRadius.circular(9.r) ,

                                                                  )
                                                              ),
                                                            ],
                                                          ),
                                                        ) ,
                                                        Container(
                                                            height: 32.h,
                                                            width: 100.w,
                                                            decoration : BoxDecoration(
                                                              color : Colors.white ,
                                                            borderRadius: BorderRadius.circular(14.r) ,

                                                            )
                                                        ),

                                                      ],) ,

                                                  ],

                                                )
                                            ),
                                            SizedBox(width: 20.w,) ,
                                          ],
                                        )
                                    )
                                  ],
                                ),
                              )
                                          ],
                                        )

                                    )  ],


                        //  Spacer(flex: 10,) ,
                      /*  Container(
                            height: 56.h,
                            width: 401.w,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.r)),
                            child:  GetBuilder<TabBarController>(

                              builder: (controller){
                                return  ElevatedButton(
                                    style: ElevatedButton.styleFrom(primary: List_of_food.isNotEmpty  ? theme().primaryColor : Color(0xffB8B4B4)),
                                    onPressed: List_of_food.isEmpty ? () { } : () {
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

                        ) , */
                        // SizedBox(height: 54.h,) ,




                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
