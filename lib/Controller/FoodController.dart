import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../View/Food.dart';

class FoodController extends GetxController {

  void Continuer(var ajouter  ,  Food food , List continuer) {

    ajouter.value = ! ajouter.value    ;
    int index = continuer.indexOf(food)  ;
    if(ajouter.value ) {
      continuer.add(food) ;
    } else {
      if (continuer.indexOf(food)  != -1)  continuer.removeAt(index);
    }

  }

}