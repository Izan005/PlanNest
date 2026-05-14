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

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';

Future showToast(
  BuildContext context,
  String mensaje,
  String tipo,
) async {
  switch (tipo) {
    case "success":
      {
        CherryToast.success(
          title: Text(mensaje, style: TextStyle(color: Colors.black)),
          animationType: AnimationType.fromRight,
          toastDuration: Duration(milliseconds: 3000),
        ).show(context);
      }

    case "error":
      {
        CherryToast.error(
          title: Text(mensaje, style: TextStyle(color: Colors.black)),
          animationType: AnimationType.fromRight,
          toastDuration: Duration(milliseconds: 3000),
        ).show(context);
      }

    case "info":
      {
        CherryToast.info(
          title: Text(mensaje, style: TextStyle(color: Colors.black)),
          animationType: AnimationType.fromRight,
          toastDuration: Duration(milliseconds: 3000),
        ).show(context);
      }

    case "warning":
      {
        CherryToast.warning(
          title: Text(mensaje, style: TextStyle(color: Colors.black)),
          animationType: AnimationType.fromRight,
          toastDuration: Duration(milliseconds: 3000),
        ).show(context);
      }

    default:
      {
        CherryToast.success(
          title: Text("Acción no registrada",
              style: TextStyle(color: Colors.black)),
          animationType: AnimationType.fromRight,
          toastDuration: Duration(milliseconds: 3000),
        ).show(context);
      }
  }
}
