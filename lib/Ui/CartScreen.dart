import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_app/Controller/AppController.dart';
import 'package:client_app/Ui/ConfirmationOrdersScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Themes/Theme.dart';
import 'Food.dart';

class CartScreen extends StatelessWidget {
   List<Food> cart ;
   CartScreen({Key? key, required this.cart, required this.inisial_price}) : super(key: key);
 final double inisial_price;
  @override
  Widget build(BuildContext context) {
    AppController controller = Get.put(AppController() , permanent: true) ;
    var cout_total = 0.0.obs ;
    cout_total.value =  inisial_price ;
    var item_index = 0.obs ;
    return  SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Spacer(flex: 1,) ,
            Expanded(
              flex: 29,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex : 1 ) ,
                  AutoSizeText('Vos commandes' ,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.sp,
                      fontFamily: 'Golos',
                    ),
                  ) ,                          // Vos commandes
                  Spacer(flex : 1 ) ,
                  AutoSizeText("Veuillez vérifier vos commandes, une fois que vous aurez confirmé votre achat, vous n’aurez pas le droit d’annuler." ,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(0xff807F7F),
                      fontSize: 17.sp,
                      fontFamily: 'Golos',
                    ),) ,                         //Text
                  Spacer(flex:1) ,
                  Expanded(
                    flex: 20,
                    child: GetBuilder<AppController>(
                      builder:(controller) {
                       return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: cart.length,
                            itemBuilder: (context, index) {

                              item_index.value =index ;
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Dismissible(
                                    key: Key(cart[index].name),
                                    onDismissed: (direction){
                                      controller.Delete(cart, cart[index] , cout_total) ;
                                      controller.Remove_from_cart(cart, cart[index]) ;
                                    },

                                    background: Container(
                                      alignment: Alignment.centerRight,
                                      color: Colors.white,
                                      child: Icon( Icons.delete , size: 30.sp , color: Color(0xff9D9D9D),),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9.r) ,
                                        color: Color(0xffE4E4E4) ,
                                      ),
                                      height: 56.h,
                                      width: 401.w,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Spacer(flex: 1,) ,
                                          Expanded(
                                            flex : 29 ,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                AutoSizeText('${cart[index].name} ${cart[index].prix} DA',
                                                  textAlign: TextAlign.start,
                                                  style:  TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.sp,
                                                    fontFamily: 'Golos',
                                                  ),
                                                ),
                                                AutoSizeText('${cart[index].description}' ,
                                                  textAlign: TextAlign.start,
                                                  style:TextStyle(
                                                    color: Color(0xff9D9D9D),
                                                    fontSize: 15.sp,
                                                    fontFamily: 'Golos',
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 24.h,
                                            width: 26.w,
                                            child: FloatingActionButton(
                                              heroTag: 'Add',
                                              onPressed: () =>

                                                  controller.increment(cart[index].counter , cart[index].prix , cout_total) ,


                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 15.sp,
                                              ),
                                              backgroundColor: Color(0xffE6424B),
                                            ),
                                          ),
                                           GetX(
                                             builder : (AppController controller) {
                                               return AutoSizeText(' ${cart[index].counter} ' ,
                                                 style:TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 20.sp,
                                                   fontFamily: 'Golos',
                                                 ),);
                                              }
                                              ) ,

                                          SizedBox(

                                            height: 24.h,
                                            width: 26.w,
                                            child: FloatingActionButton(
                                              heroTag: 'Remove',
                                              onPressed: () =>

                                                  controller.decrement(cart[index].counter , cart[index].prix , cout_total ) ,
                                              child: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                                size: 15.sp,
                                              ),
                                              backgroundColor: Color(0xffE6424B),
                                            ),
                                          ),
                                          Spacer(flex: 1,) ,
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height :18.h) ,
                                  (item_index.value == cart.length-1 && cart.isNotEmpty)?
                                  Container(
                                    height : 400.h ,
                                    width : 400.w ,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Spacer(flex: 1),
                                        AutoSizeText(
                                            'Coût total' ,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 28.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Golos',
                                            )
                                        ) ,                      // Cout total
                                        Spacer(flex: 1),
                                        Row(
                                            children : [
                                              Expanded(
                                                  child: AutoSizeText('Vos commandes' ,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17.sp,
                                                        fontFamily: 'Golos'
                                                    ),)
                                              ) ,
                                              GetX(
                                                builder: (AppController controller) {
                                                  return AutoSizeText('${cout_total} DA' ,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Color(0xffE6424B),
                                                        fontSize: 17.sp,
                                                        fontFamily: 'Golos'
                                                    ),);
                                                },
                                              ) ,
                                            ]
                                        ) ,                              // Vos commandes
                                        SizedBox(height: 10.h,),
                                        Row(
                                            children : [
                                              Expanded(
                                                  child: AutoSizeText('Livraison' ,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17.sp,
                                                        fontFamily: 'Golos'
                                                    ),)
                                              ) ,
                                              AutoSizeText('500 DA' ,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: Color(0xffE6424B),
                                                    fontSize: 17.sp,
                                                    fontFamily: 'Golos'
                                                ),) ,
                                            ]
                                        ) ,                             //Livraison
                                        SizedBox(height: 10.h,),
                                        Row(
                                            children : [
                                              Expanded(
                                                  child: AutoSizeText('Total' ,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 17.sp,
                                                        fontFamily: 'Golos'
                                                    ),)
                                              ) ,
                                              GetX(
                                                builder: (AppController controller) {
                                                  return AutoSizeText('${cout_total.value+ 500} DA' ,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Color(0xffE6424B),
                                                        fontSize: 17.sp,
                                                        fontFamily: 'Golos'
                                                    ),);
                                                },
                                              ) ,
                                            ]
                                        ) ,                            // Total
                                        Spacer(flex: 2,) ,

                                        Container(
                                          height: 56.h,
                                          width: 401.w,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.r)),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(primary: theme().primaryColor ),
                                              onPressed: () {

                                                Get.to(ConfirmationOrdersScreen()) ;
 },
                                              child: AutoSizeText('Continue' ,
                                                style: TextStyle(
                                                    fontFamily: 'Golos',
                                                    fontSize: 22.sp,
                                                    fontWeight: FontWeight.bold),
                                              )),
                                        ) ,                     // Button
                                        Spacer(flex: 5,) ,
                                      ],
                                    ),
                                  ) :  Container()


                                ],
                              );

                            });
                      },


                    ),
                  ) ,
                ],
              ),
            ),
            Spacer(flex: 1,) ,
          ],
        ),
      ),
    );
  }
}
