import '../database.dart';

class SharedItemsTable extends SupabaseTable<SharedItemsRow> {
  @override
  String get tableName => 'shared_items';

  @override
  SharedItemsRow createRow(Map<String, dynamic> data) => SharedItemsRow(data);
}

class SharedItemsRow extends SupabaseDataRow {
  SharedItemsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SharedItemsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get taskId => getField<int>('task_id');
  set taskId(int? value) => setField<int>('task_id', value);

  int? get noteId => getField<int>('note_id');
  set noteId(int? value) => setField<int>('note_id', value);

  String? get ownerId => getField<String>('owner_Id');
  set ownerId(String? value) => setField<String>('owner_Id', value);

  String? get guestId => getField<String>('guest_id');
  set guestId(String? value) => setField<String>('guest_id', value);

  bool? get accepted => getField<bool>('accepted');
  set accepted(bool? value) => setField<bool>('accepted', value);
}
