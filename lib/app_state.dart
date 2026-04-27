import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_userLogged')) {
        try {
          final serializedData = prefs.getString('ff_userLogged') ?? '{}';
          _userLogged =
              UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserStruct _userLogged = UserStruct();
  UserStruct get userLogged => _userLogged;
  set userLogged(UserStruct value) {
    _userLogged = value;
    prefs.setString('ff_userLogged', value.serialize());
  }

  void updateUserLoggedStruct(Function(UserStruct) updateFn) {
    updateFn(_userLogged);
    prefs.setString('ff_userLogged', _userLogged.serialize());
  }

  List<int> _selectedNoteIds = [];
  List<int> get selectedNoteIds => _selectedNoteIds;
  set selectedNoteIds(List<int> value) {
    _selectedNoteIds = value;
  }

  void addToSelectedNoteIds(int value) {
    selectedNoteIds.add(value);
  }

  void removeFromSelectedNoteIds(int value) {
    selectedNoteIds.remove(value);
  }

  void removeAtIndexFromSelectedNoteIds(int index) {
    selectedNoteIds.removeAt(index);
  }

  void updateSelectedNoteIdsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    selectedNoteIds[index] = updateFn(_selectedNoteIds[index]);
  }

  void insertAtIndexInSelectedNoteIds(int index, int value) {
    selectedNoteIds.insert(index, value);
  }

  String _onesignalAppId = '63ab18a7-f273-448e-b08f-50162d431705';
  String get onesignalAppId => _onesignalAppId;
  set onesignalAppId(String value) {
    _onesignalAppId = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
