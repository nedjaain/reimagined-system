import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_app/View/Category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../View/Food.dart';

class TabBarController extends GetxController with GetTickerProviderStateMixin {
 /* late TabController tabController  ;





  List<Widget> tabs (List <Category> cat) {
    List<Widget> tb = [] ;
    for (Category category in cat) (
     tb.add(
         AutoSizeText(
       category.nom_cat ,
       textAlign: TextAlign.start,

       )

     )
    ) ;
    return tb ;
  }



  void inisialize ( int category_length , int selected_item ) {
    tabController = TabController(length: category_length, vsync: this , initialIndex: selected_item ) ;
  }

  @override
  void onInit() {

    super.onInit();
  }
 @override
  void onReady() {


    super.onReady();
  }
  @override
  void onClose() {

    tabController.dispose();
    super.onClose();
  }*/
}