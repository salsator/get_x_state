import 'dart:async';
import 'package:floor/floor.dart';
import 'package:get_x_state/database/dao_monster.dart';
import 'package:get_x_state/database/monster.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Monster])
abstract class AppDatabase extends FloorDatabase {
  MonsterDao get monsterDao;
}