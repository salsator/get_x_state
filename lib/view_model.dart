import 'package:get/state_manager.dart';

import 'model/model.dart';

class ViewModel extends GetxController{
  RxInt zivoty = 100.obs;
  RxString jmeno= "hrdina".obs;
  RxInt mana = 10.obs;
  RxBool isMonster = false.obs;

  Model mod = Model();

  fastStrike()
  {
      zivoty.value -= 5;
  }

  heavyStrike()
  {
    zivoty.value -= 10;
    mana.value -=  5;
  }

  defenceStrike()
  {
    mana.value += 5;
  }


}