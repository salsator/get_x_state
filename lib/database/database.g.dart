// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MonsterDao? _monsterDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Monster` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `name` TEXT NOT NULL, `hp` INTEGER NOT NULL, `ac` INTEGER NOT NULL, `lvl` INTEGER NOT NULL, `dmgDice` INTEGER NOT NULL, `dmgBonus` INTEGER NOT NULL, `def` INTEGER NOT NULL, `goldDrop` INTEGER NOT NULL, `xp` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MonsterDao get monsterDao {
    return _monsterDaoInstance ??= _$MonsterDao(database, changeListener);
  }
}

class _$MonsterDao extends MonsterDao {
  _$MonsterDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _monsterInsertionAdapter = InsertionAdapter(
            database,
            'Monster',
            (Monster item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'hp': item.hp,
                  'ac': item.ac,
                  'lvl': item.lvl,
                  'dmgDice': item.dmgDice,
                  'dmgBonus': item.dmgBonus,
                  'def': item.def,
                  'goldDrop': item.goldDrop,
                  'xp': item.xp
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Monster> _monsterInsertionAdapter;

  @override
  Future<List<Monster>> findAllMonster() async {
    return _queryAdapter.queryList('SELECT * FROM Person',
        mapper: (Map<String, Object?> row) => Monster(
            row['id'] as int,
            row['name'] as String,
            row['ac'] as int,
            row['hp'] as int,
            row['lvl'] as int,
            row['dmgDice'] as int,
            row['goldDrop'] as int,
            row['xp'] as int,
            def: row['def'] as int,
            dmgBonus: row['dmgBonus'] as int));
  }

  @override
  Stream<Monster?> findMonsterById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Person WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Monster(
            row['id'] as int,
            row['name'] as String,
            row['ac'] as int,
            row['hp'] as int,
            row['lvl'] as int,
            row['dmgDice'] as int,
            row['goldDrop'] as int,
            row['xp'] as int,
            def: row['def'] as int,
            dmgBonus: row['dmgBonus'] as int),
        arguments: [id],
        queryableName: 'Person',
        isView: false);
  }

  @override
  Future<void> insertMonster(Monster monster) async {
    await _monsterInsertionAdapter.insert(monster, OnConflictStrategy.abort);
  }
}
