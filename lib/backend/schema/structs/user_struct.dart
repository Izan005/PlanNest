// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? id,
    String? username,
    int? score,
    int? taskStrike,
    String? email,
  })  : _id = id,
        _username = username,
        _score = score,
        _taskStrike = taskStrike,
        _email = email;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "score" field.
  int? _score;
  int get score => _score ?? 0;
  set score(int? val) => _score = val;

  void incrementScore(int amount) => score = score + amount;

  bool hasScore() => _score != null;

  // "task_strike" field.
  int? _taskStrike;
  int get taskStrike => _taskStrike ?? 0;
  set taskStrike(int? val) => _taskStrike = val;

  void incrementTaskStrike(int amount) => taskStrike = taskStrike + amount;

  bool hasTaskStrike() => _taskStrike != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        id: data['id'] as String?,
        username: data['username'] as String?,
        score: castToType<int>(data['score']),
        taskStrike: castToType<int>(data['task_strike']),
        email: data['email'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'username': _username,
        'score': _score,
        'task_strike': _taskStrike,
        'email': _email,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'score': serializeParam(
          _score,
          ParamType.int,
        ),
        'task_strike': serializeParam(
          _taskStrike,
          ParamType.int,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        score: deserializeParam(
          data['score'],
          ParamType.int,
          false,
        ),
        taskStrike: deserializeParam(
          data['task_strike'],
          ParamType.int,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        id == other.id &&
        username == other.username &&
        score == other.score &&
        taskStrike == other.taskStrike &&
        email == other.email;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, username, score, taskStrike, email]);
}

UserStruct createUserStruct({
  String? id,
  String? username,
  int? score,
  int? taskStrike,
  String? email,
}) =>
    UserStruct(
      id: id,
      username: username,
      score: score,
      taskStrike: taskStrike,
      email: email,
    );
