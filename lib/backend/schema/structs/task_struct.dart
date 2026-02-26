// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaskStruct extends BaseStruct {
  TaskStruct({
    int? id,
    String? priority,
    String? taskName,
    DateTime? expirationDate,
  })  : _id = id,
        _priority = priority,
        _taskName = taskName,
        _expirationDate = expirationDate;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "priority" field.
  String? _priority;
  String get priority => _priority ?? '';
  set priority(String? val) => _priority = val;

  bool hasPriority() => _priority != null;

  // "task_name" field.
  String? _taskName;
  String get taskName => _taskName ?? '';
  set taskName(String? val) => _taskName = val;

  bool hasTaskName() => _taskName != null;

  // "expiration_date" field.
  DateTime? _expirationDate;
  DateTime? get expirationDate => _expirationDate;
  set expirationDate(DateTime? val) => _expirationDate = val;

  bool hasExpirationDate() => _expirationDate != null;

  static TaskStruct fromMap(Map<String, dynamic> data) => TaskStruct(
        id: castToType<int>(data['id']),
        priority: data['priority'] as String?,
        taskName: data['task_name'] as String?,
        expirationDate: data['expiration_date'] as DateTime?,
      );

  static TaskStruct? maybeFromMap(dynamic data) =>
      data is Map ? TaskStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'priority': _priority,
        'task_name': _taskName,
        'expiration_date': _expirationDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'priority': serializeParam(
          _priority,
          ParamType.String,
        ),
        'task_name': serializeParam(
          _taskName,
          ParamType.String,
        ),
        'expiration_date': serializeParam(
          _expirationDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static TaskStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaskStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        priority: deserializeParam(
          data['priority'],
          ParamType.String,
          false,
        ),
        taskName: deserializeParam(
          data['task_name'],
          ParamType.String,
          false,
        ),
        expirationDate: deserializeParam(
          data['expiration_date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'TaskStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaskStruct &&
        id == other.id &&
        priority == other.priority &&
        taskName == other.taskName &&
        expirationDate == other.expirationDate;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, priority, taskName, expirationDate]);
}

TaskStruct createTaskStruct({
  int? id,
  String? priority,
  String? taskName,
  DateTime? expirationDate,
}) =>
    TaskStruct(
      id: id,
      priority: priority,
      taskName: taskName,
      expirationDate: expirationDate,
    );
