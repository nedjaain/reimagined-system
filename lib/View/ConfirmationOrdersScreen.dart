import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Themes/Theme.dart';

class ConfirmationOrdersScreen extends StatelessWidget {
  const ConfirmationOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String adresse = '6958+WP4, Sidi Bel Abbès 22000' ;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Row(
          children: [
            Spacer(flex: 1,) ,
            Expanded(
              flex: 29,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 1,) ,
                  Positioned(
                    top: 10.h,
                    left: 13.w,
                    child: SizedBox(
                      height: 28.h,
                      width: 29.w,
                      child: FloatingActionButton(
                        foregroundColor:  Color(0xffDFDFDF) ,
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
                  Spacer(flex: 1,) ,
                  AutoSizeText('Vos informations' ,
                    textAlign: TextAlign.start,
                    style: theme().textTheme.headline1
                  ) ,                          // Vos informations
                  Spacer(flex : 1 ) ,
                  AutoSizeText("Veuillez vérifier vos commandes, une fois que vous aurez confirmé votre achat, vous n’aurez pas le droit d’annuler." ,
                    textAlign: TextAlign.start,
                    style: theme().textTheme.headline5

                  ) ,                         //Text
                  Spacer(flex:1) ,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.r) ,
                      color: Color(0xffE4E4E4) ,
                    ),
                    //height: 56.h,
                    width: 401.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(flex: 1,) ,
                        Image.asset(
                            'lib/Asset/Images/Location.png' ,
                             height : 27.h ,
                             width: 25.w,) ,
                        Spacer(flex: 1,) ,
                        Expanded(
                          flex: 29,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText("Votre adresss" ,
                                textAlign: TextAlign.start,
                                style: theme().textTheme.bodyText1?.copyWith(color: Colors.black),) ,
                              AutoSizeText( adresse,
                                textAlign: TextAlign.start,
                                style: theme().textTheme.bodyText1,) ,

                            ],
                          ),
                        ) ,
                        TextButton(
                           onPressed: () {  },
                            child: AutoSizeText(
                              'Modifier' ,
                              textAlign: TextAlign.start,
                              style: theme().textTheme.bodyText1?.copyWith(color: Color(0xffE6424B)) ,
                            ),
                        )
                      ],
                    )

                  ),
                  Spacer(flex: 1,) ,
                  Container(
                    height:383.h ,
                    width: 401.w,
                    child: TextField(
                      maxLines: 20,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Écrire un message ( optionnelle )'  ,
                       hintStyle: theme().textTheme.headline4?.copyWith(color :Color(0xff9F9999) , fontWeight: FontWeight.normal ) ,
                        labelStyle:  theme().textTheme.headline4?.copyWith(color :Colors.black , fontWeight: FontWeight.normal ) ,

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.r)  ,
                            borderSide: BorderSide.none) ,
                        filled: true ,
                        fillColor: Color(0xffE4E4E4),

                      ),

                    ),
                  ),
                  Spacer(flex: 2,) ,
                  Container(
                    height: 56.h,
                    width: 401.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.r)),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: theme().primaryColor ,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9.0),
                                side: BorderSide(color: Colors.red))),
                        onPressed: () {
                          },
                        child: AutoSizeText('Confirmer' ,
                          style: theme().textTheme.headline2
                        )),
                  ) ,
                  Spacer(flex: 6,)
                ],
              ),
            ),
            Spacer(flex: 1,) ,
          ],
        ) ,
      ),
    );
  }
}
