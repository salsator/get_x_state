import 'package:floor/floor.dart';
import 'package:get_x_state/database/monster.dart';

@dao
abstract class MonsterDao{
  @Query('SELECT * FROM Person')
  Future<List<Monster>> findAllMonster();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<Monster?> findMonsterById(int id);

  @insert
  Future<void> insertMonster(Monster monster);

}