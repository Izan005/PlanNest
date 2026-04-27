// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationStruct extends BaseStruct {
  NotificationStruct({
    String? title,
    String? text,
    String? task,
    String? note,
    String? owner,
  })  : _title = title,
        _text = text,
        _task = task,
        _note = note,
        _owner = owner;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "task" field.
  String? _task;
  String get task => _task ?? '';
  set task(String? val) => _task = val;

  bool hasTask() => _task != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  // "owner" field.
  String? _owner;
  String get owner => _owner ?? '';
  set owner(String? val) => _owner = val;

  bool hasOwner() => _owner != null;

  static NotificationStruct fromMap(Map<String, dynamic> data) =>
      NotificationStruct(
        title: data['title'] as String?,
        text: data['text'] as String?,
        task: data['task'] as String?,
        note: data['note'] as String?,
        owner: data['owner'] as String?,
      );

  static NotificationStruct? maybeFromMap(dynamic data) => data is Map
      ? NotificationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'text': _text,
        'task': _task,
        'note': _note,
        'owner': _owner,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'task': serializeParam(
          _task,
          ParamType.String,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'owner': serializeParam(
          _owner,
          ParamType.String,
        ),
      }.withoutNulls;

  static NotificationStruct fromSerializableMap(Map<String, dynamic> data) =>
      NotificationStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        task: deserializeParam(
          data['task'],
          ParamType.String,
          false,
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        owner: deserializeParam(
          data['owner'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NotificationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationStruct &&
        title == other.title &&
        text == other.text &&
        task == other.task &&
        note == other.note &&
        owner == other.owner;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([title, text, task, note, owner]);
}

NotificationStruct createNotificationStruct({
  String? title,
  String? text,
  String? task,
  String? note,
  String? owner,
}) =>
    NotificationStruct(
      title: title,
      text: text,
      task: task,
      note: note,
      owner: owner,
    );
