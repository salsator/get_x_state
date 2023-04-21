import 'package:floor/floor.dart';
import 'package:get/get.dart';
import 'package:get_x_state/database/database.dart';
import 'package:get_x_state/database/monster.dart';

class HeroViewModel extends GetxController {

  var monster = Monster(
      1,
      "hydra",
      12,
      102,
      5,
      10,
      30,
      130,
      dmgBonus: 2);

  RxList<Monster>? monsters;

  RxInt button = 0.obs;


  void addMonster(Monster monster) async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db')
        .build();
    final monsterDao = database.monsterDao;
    await monsterDao.insertMonster(monster);
  }

  void getMonsterList() async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db')
        .build();
    final monsterDao = database.monsterDao;
    final result = await monsterDao.findAllMonster();
    print(result.first.name);
    RxList<Monster> monstra = RxList<Monster>([]);
    monstra.add(result.first);
    monsters = monstra;
  }


  setButton() async
  {
    print("hoj");
    await Duration(seconds: 2);
   if ( button.value == 1)
     {
       button.value =2;
     }else{
     button.value = 1;
   }

  }




}