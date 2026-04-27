import '../database.dart';

class UserTable extends SupabaseTable<UserRow> {
  @override
  String get tableName => 'user';

  @override
  UserRow createRow(Map<String, dynamic> data) => UserRow(data);
}

class UserRow extends SupabaseDataRow {
  UserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  int? get score => getField<int>('score');
  set score(int? value) => setField<int>('score', value);

  int? get taskStrike => getField<int>('task_strike');
  set taskStrike(int? value) => setField<int>('task_strike', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String? get onesignalId => getField<String>('onesignal_id');
  set onesignalId(String? value) => setField<String>('onesignal_id', value);
}
