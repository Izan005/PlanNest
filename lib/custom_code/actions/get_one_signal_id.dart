// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<String?> getOneSignalId() async {
  // Esperamos un momento para dar tiempo al SDK a sincronizarse
  // Solo si es necesario (puedes ajustar el tiempo)
  await Future.delayed(Duration(milliseconds: 500));

  final id = OneSignal.User.pushSubscription.id;

  if (id == null || id.isEmpty) {
    // Si sigue siendo null, intentamos obtenerlo de nuevo tras un breve suspiro
    debugPrint("OneSignal ID aún no disponible, reintentando...");
    await Future.delayed(Duration(seconds: 1));
    return OneSignal.User.pushSubscription.id;
  }

  return id;
}
