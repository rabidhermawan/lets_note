import 'package:drift/drift.dart';

class Note extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().nullable()();
  TextColumn get content => text().named('body').nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get isReminder => boolean().withDefault(const Constant(false))();
  BoolColumn get reminderComplete =>
      boolean().withDefault(const Constant(false))();
  DateTimeColumn get dateReminder => dateTime().nullable()();
}
