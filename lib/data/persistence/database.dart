import 'package:drift/drift.dart';
import 'database_native.dart' if (dart.library.html) 'database_web.dart' as impl;

part 'database.g.dart';

class CamerasTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get host => text()();
  IntColumn get port => integer()();
  TextColumn get username => text()();
  TextColumn get password => text()();
  BoolColumn get hasPtz => boolean().withDefault(const Constant(false))();
  BoolColumn get hasProfileG => boolean().withDefault(const Constant(false))();
  BoolColumn get hasSnapshot => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}

class DownloadsTable extends Table {
  TextColumn get id => text()();
  TextColumn get cameraId => text()();
  TextColumn get sourceUri => text()();
  TextColumn get outputPath => text()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  RealColumn get progress => real().withDefault(const Constant(0.0))();
  IntColumn get status => integer().withDefault(const Constant(0))();
  TextColumn get errorMessage => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [CamerasTable, DownloadsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(impl.createDatabaseConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from == 1) {
          await m.createTable(downloadsTable);
        }
      },
    );
  }
}
