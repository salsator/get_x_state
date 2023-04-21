import 'package:floor/floor.dart';

@entity
class Monster {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String name;
   int hp;
   int ac;
   int lvl;
   int dmgDice;
   int dmgBonus;
   int def;
   int goldDrop;
   int xp;



  Monster(this.id, this.name, this.ac, this.hp, this.lvl,
      this.dmgDice, this.goldDrop, this.xp,
      {this.def =0, this.dmgBonus=0});

}