import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../View/Category.dart';
import '../View/Food.dart';
import '../View/OpenTime.dart';
import '../View/Restaurant.dart';

class Restaurants_controller extends GetxController {
  bool is_loaded = false;
  final List <Restaurant> restaurants = [

    Restaurant(image: 'lib/Asset/Images/rest.jpg', name: 'DamiS', category: [
      Category([Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,   ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,) ,Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza 4 Fromages', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,)], 'Pizza') ,
      Category([ Food(image: 'lib/Asset/Images/Pizza.png', name: ' Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    )], 'Tacos')   ,Category([], 'Tacos') ,Category([], 'Burger')].obs, adress: 'Oran ,Oran', state: true, openTime: OpenTime(TimeOfDay(hour: 23, minute:32), TimeOfDay(hour:21, minute: 46)) ,) ,
  ];
  @override
  void onInit() {
    super.onInit();
    loading() ;
  }
  @override


  Future loading() async{
    is_loaded = false ;
    await Future.delayed(Duration(seconds: 1) , (){}) ;
    is_loaded = true;
    update();

  }


}

