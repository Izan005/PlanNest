import '../database.dart';

class TaskTable extends SupabaseTable<TaskRow> {
  @override
  String get tableName => 'task';

  @override
  TaskRow createRow(Map<String, dynamic> data) => TaskRow(data);
}

class TaskRow extends SupabaseDataRow {
  TaskRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TaskTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get priority => getField<String>('priority');
  set priority(String? value) => setField<String>('priority', value);

  String? get taskName => getField<String>('task_name');
  set taskName(String? value) => setField<String>('task_name', value);

  DateTime? get expirationDate => getField<DateTime>('expiration_date');
  set expirationDate(DateTime? value) =>
      setField<DateTime>('expiration_date', value);

  bool? get completedAtTime => getField<bool>('completed_at_time');
  set completedAtTime(bool? value) =>
      setField<bool>('completed_at_time', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  bool? get notified => getField<bool>('notified');
  set notified(bool? value) => setField<bool>('notified', value);

  int? get associatedNote => getField<int>('associated_note');
  set associatedNote(int? value) => setField<int>('associated_note', value);
}
