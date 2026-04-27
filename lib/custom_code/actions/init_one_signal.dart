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

Future initOneSignal(String appId) async {
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  //Inicializa OneSignal con el id de app recogido
  OneSignal.initialize(appId);

  // Solicitamos al usuario los permisos de notificación para la app
  OneSignal.Notifications.requestPermission(true);
}
