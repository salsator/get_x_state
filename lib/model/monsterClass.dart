import 'dart:math';

class MonsterClass{
  int hp;
  int dmg;
 final String name;
  final String image;
  int mana = 0;
  MonsterClass(this.hp, this.dmg, this.name, this.image);

  MonsterClass.manaMonster(this.hp, this.dmg, this.name, this.image)
  {
   mana = 10;
  }


  akce()
  {
   var rng = Random();
   int action = rng.nextInt(3);


  }


  heal()
  {
   hp += 5;
  }
  int attack()
  {
   var rng = Random();
   int mod = rng.nextInt(4);
   return dmg;
  }








}