import '../database.dart';

class NoteTable extends SupabaseTable<NoteRow> {
  @override
  String get tableName => 'note';

  @override
  NoteRow createRow(Map<String, dynamic> data) => NoteRow(data);
}

class NoteRow extends SupabaseDataRow {
  NoteRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NoteTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get text => getField<String>('text');
  set text(String? value) => setField<String>('text', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
