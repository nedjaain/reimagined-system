import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../View/Category.dart';
import '../View/Food.dart';
import '../View/Food_Search.dart';
import '../View/OpenTime.dart';
import '../View/Restaurant.dart';

class SearchController extends GetxController {


  final List <Restaurant> restaurants = [

    Restaurant(image: 'lib/Asset/Images/rest.jpg', name: 'DamiS', category: [
      Category([Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,   ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,) ,Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza 4 Fromages', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,)], 'Pizza') ,
      Category([ Food(image: 'lib/Asset/Images/Pizza.png', name: ' Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    )], 'Tacos')   ,Category([], 'Tacos') ,Category([], 'Burger')].obs, adress: 'Oran ,Oran', state: true, openTime: OpenTime(TimeOfDay(hour: 23, minute:32), TimeOfDay(hour:21, minute: 46)) ,) ,
    Restaurant(image: 'lib/Asset/Images/rest.jpg', name: 'DamiS', category: [
      Category([Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,   ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,) ,Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza 4 Fromages', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,)], 'Pizza') ,
      Category([ Food(image: 'lib/Asset/Images/Pizza.png', name: ' Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    )], 'Tacos')   ,Category([], 'Tacos') ,Category([], 'Burger')].obs, adress: 'Oran ,Oran', state: true, openTime: OpenTime(TimeOfDay(hour: 23, minute:32), TimeOfDay(hour:21, minute: 46)) ,) ,
    Restaurant(image: 'lib/Asset/Images/rest.jpg', name: 'DamiS', category: [
      Category([Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,   ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,) ,Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza 4 Fromages', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,)], 'Pizza') ,
      Category([ Food(image: 'lib/Asset/Images/Pizza.png', name: ' Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    )], 'Tacos')   ,Category([], 'Tacos') ,Category([], 'Burger')].obs, adress: 'Oran ,Oran', state: true, openTime: OpenTime(TimeOfDay(hour: 23, minute:32), TimeOfDay(hour:21, minute: 46)) ,) ,


  ];


  /*  Restaurant(image: 'lib/Asset/Images/Restaurant1.png', name: 'Magic Pizza',
      category: [Category([], 'Pizza') ,].obs, adress: 'Oran ,Oran', state: true, openTime: OpenTime(22 , 15) ,) ,



    Restaurant(image: 'lib/Asset/Images/rest.jpg', name: 'DamiS', category: [
      Category([Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,   ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,) ,Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza 4 Fromages', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,)], 'Pizza') ,
      Category([ Food(image: 'lib/Asset/Images/Pizza.png', name: ' Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    )], 'Tacos')   ,Category([], 'Tacos') ,Category([], 'Burger')].obs, adress: 'Oran ,Oran', state: true, openTime: OpenTime(22 , 15), ) ,


   Restaurant(image: 'lib/Asset/Images/rest2.jpg', name: 'Milano', category: [Category([], 'Pizza') ,Category([], 'Chicken') ,Category([], 'Sandwich')].obs, adress: 'Oran ,Oran', state: true, openTime: OpenTime(22 , 15), ) ,
  */








  final  List <Map<String , List<Food_Search>>> food =[

    { 'Pizza': [Food_Search(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage',
      restaurant: Restaurant(image: 'lib/Asset/Images/rest.jpg', name: 'DamiS', category: [
        Category([Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,   ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,) ,Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza 4 Fromages', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,)], 'Pizza') ,
        Category([ Food(image: 'lib/Asset/Images/Pizza.png', name: ' Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    )], 'Tacos')   ,Category([], 'Tacos') ,Category([], 'Burger')].obs, adress: 'Oran ,Oran', state: true, openTime: OpenTime(TimeOfDay(hour: 23, minute:32), TimeOfDay(hour:21, minute: 46)) ,) ,

    ) ,

      Food_Search(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', restaurant:
      Restaurant(image: 'lib/Asset/Images/rest.jpg', name: 'DamiS', category: [
        Category([Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,   ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,) ,Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza 4 Fromages', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,)], 'Pizza') ,
        Category([ Food(image: 'lib/Asset/Images/Pizza.png', name: ' Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    )], 'Tacos')   ,Category([], 'Tacos') ,Category([], 'Burger')].obs, adress: 'Oran ,Oran', state: true, openTime: OpenTime(TimeOfDay(hour: 23, minute:32), TimeOfDay(hour:21, minute: 46)) ,) ,

      ) ,

      Food_Search(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', restaurant:
      Restaurant(image: 'lib/Asset/Images/rest.jpg', name: 'DamiS', category: [
        Category([Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,   ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,) ,Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza 4 Fromages', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,)], 'Pizza') ,
        Category([ Food(image: 'lib/Asset/Images/Pizza.png', name: ' Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    )], 'Tacos')   ,Category([], 'Tacos') ,Category([], 'Burger')].obs, adress: 'Oran ,Oran', state: true, openTime: OpenTime(TimeOfDay(hour: 23, minute:32), TimeOfDay(hour:21, minute: 46)) ,) ,

      ) ]} ,



    { 'Salade' : [Food_Search(image: 'lib/Asset/Images/Pizza.png', name: 'Salade Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', restaurant:
    Restaurant(image: 'lib/Asset/Images/rest.jpg', name: 'DamiS', category: [
      Category([Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,   ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,) ,Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza 4 Fromages', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,)], 'Pizza') ,
      Category([ Food(image: 'lib/Asset/Images/Pizza.png', name: ' Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    )], 'Tacos')   ,Category([], 'Tacos') ,Category([], 'Burger')].obs, adress: 'Oran ,Oran', state: true, openTime: OpenTime(TimeOfDay(hour: 23, minute:32), TimeOfDay(hour:21, minute: 46)) ,) ,


    ) ,
                  Food_Search(image: 'lib/Asset/Images/Pizza.png', name: 'Salade Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', restaurant:
                  Restaurant(image: 'lib/Asset/Images/rest.jpg', name: 'DamiS', category: [
                    Category([Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,   ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,) ,Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza 4 Fromages', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,)], 'Pizza') ,
                    Category([ Food(image: 'lib/Asset/Images/Pizza.png', name: ' Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    )], 'Tacos')   ,Category([], 'Tacos') ,Category([], 'Burger')].obs, adress: 'Oran ,Oran', state: true, openTime: OpenTime(TimeOfDay(hour: 23, minute:32), TimeOfDay(hour:21, minute: 46)) ,) ,

                  ) ,

                  Food_Search(image: 'lib/Asset/Images/Pizza.png', name: 'Salade Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', restaurant:
                  Restaurant(image: 'lib/Asset/Images/rest.jpg', name: 'DamiS', category: [
                    Category([Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,   ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,) ,Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs, ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza 4 Fromages', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,)], 'Pizza') ,
                    Category([ Food(image: 'lib/Asset/Images/Pizza.png', name: ' Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ajouter: false.obs,    )], 'Tacos')   ,Category([], 'Tacos') ,Category([], 'Burger')].obs, adress: 'Oran ,Oran', state: true, openTime: OpenTime(TimeOfDay(hour: 23, minute:32), TimeOfDay(hour:21, minute: 46)) ,) ,

                  ) ,
    ] }, ];


  void scroll( var visible) {
    visible.value = false ;
    update() ;
  }
}
//controller.position.userScrollDirection == ScrollDirection.forward