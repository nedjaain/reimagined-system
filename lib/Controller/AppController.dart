import 'package:client_app/Ui/Category.dart';
import 'package:client_app/Ui/Food.dart';
import 'package:client_app/Ui/Restaurant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Ui/OnBoarding_Pages.dart';
class AppController extends GetxController {

  late PageController controller ;

  int page_index=0 ;

  final List<OnBoard> pages = [
    OnBoard(image: 'lib/Asset/Images/onBoardingImage1.png', title: "Le temps est précieux , n'est-ce pas?",
        description:
        "Avec notre service rapide , vous n’aurez plus à vous soucier de l’heure de votre repas") ,
    OnBoard(image: 'lib/Asset/Images/onBoardingImage2.png', title: "Un seul clic et vous avez terminé",
        description:
        "Le reste est sur nous, nous vous apportons vos aliments préférés") ,
    OnBoard(image: 'lib/Asset/Images/onBoardingImage3.png', title: "Nous somme là!",
        description:
        "Avec notre service rapide , vous n’aurez plus à vous soucier de l’heure de votre repas") ,
  ] ;

   List<Restaurant> restaurants = [
     Restaurant(image: 'lib/Asset/Images/Restaurant1.png', name: 'Magic Pizza', category: [Category([], 'Pizza') ,], adress: 'Oran ,Oran', state: true) ,
    Restaurant(image: 'lib/Asset/Images/Restaurant1.png', name: 'DamiS', category: [
      Category([Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza Poulet', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', ) , Food(image: 'lib/Asset/Images/Pizza.png', name: ' Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage',  ) ,Food(image: 'lib/Asset/Images/Pizza.png', name: ' Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage',  ) , Food(image: 'lib/Asset/Images/Pizza.png', name: ' Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage',  ) , Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza 4 Fromages', prix: 500, description: 'Fromage, Poulet, Sauce Fromage', )], 'Pizza') ,
      Category([ Food(image: 'lib/Asset/Images/Pizza.png', name: ' Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage',  ) , Food(image: 'lib/Asset/Images/Pizza.png', name: ' Mega Pizza', prix: 500, description: 'Fromage, Poulet, Sauce Fromage',  )], 'Tacos')   ,Category([], 'Tacos') ,Category([], 'Burger')], adress: 'Oran ,Oran', state: true) ,
    Restaurant(image: 'lib/Asset/Images/Restaurant1.png', name: 'Milano', category: [Category([], 'Pizza') ,Category([], 'Chicken') ,Category([], 'Sandwich')], adress: 'Oran ,Oran', state: true) ,

];
  List<Food> Pizza = [

    Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza Poulet', prix : 500.0 ,  List_of_food: [], description: '', ) ,
    Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza Fumé', prix : 600.0 ,  List_of_food: [], description: '',  ) ,
    Food(image: 'lib/Asset/Images/Pizza.png', name: 'Mega Pizza', prix : 1700.0  , List_of_food: [], description: '',  ) ,
    Food(image: 'lib/Asset/Images/Pizza.png', name: 'Pizza 4 Fromage', prix : 600.0  , List_of_food: [], description: '',  ) ,
    ];


  void onchange (int index ){
    page_index =index ;
    update () ;
  }
  void increment(var counter , double prix , var cout_total) {
     counter.value <= 30 ? (){ counter++ ; cout_total.value = (cout_total.value)+  prix ;  }() : counter ;
     print(counter) ;
    update() ;
  }
  void decrement (var counter, double prix , var cout_total){
     counter.value >1 ? (){ counter-- ; cout_total.value = (cout_total.value)-  prix ;  } (): counter ;
     print(counter) ;
    update();
  }

  void Delete ( List<Food> cart , Food food , var cout_total ){
    Get.snackbar(
      'Supprimer', 'Cet élément a été supprimé' ,
      duration: Duration(seconds: 3) ,
      snackPosition: SnackPosition.BOTTOM ,
      backgroundColor: Color(0xffE4E4E4)
    ) ;
    cout_total.value = cout_total.value - food.prix * food.counter.value ;
    update() ;

  }
  void Remove_from_cart(List<Food> cart , Food food) {
    cart.remove(food) ;
    update() ;
  }


  @override
  void onInit() {

    controller = PageController(initialPage: 0) ;

    super.onInit();
  }
  @override
  void onClose() {
    controller.dispose() ;

    super.onClose();
  }

}