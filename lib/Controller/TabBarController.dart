import 'package:auto_size_text/auto_size_text.dart';
import 'package:client_app/Ui/Category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Ui/Food.dart';

class TabBarController extends GetxController with GetTickerProviderStateMixin {
  late TabController tabController  ;





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
  void Continuer(bool ajouter , Food food , List continuer) {

    int index = continuer.indexOf(food)  != -1 ? continuer.indexOf(food) : 0 ;
    if(ajouter ) {
      continuer.add(food) ;
    } else {
      continuer.removeAt(index);
    }
    update() ;
  }

 void ListOfFood ( List continuer , List<Food> cart ,var  somme ) {
   for (var plat in continuer) {
     cart.add(plat);
     somme.value = somme.value + plat.prix * plat.counter.value ;
   }
   update() ;
 }

  void inisialize ( int category_length ) {
    tabController = TabController(length: category_length, vsync: this) ;
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
  }
}