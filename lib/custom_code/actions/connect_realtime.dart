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

//
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future connectRealtime(
  String table,
  Future Function() action,
) async {
  // Add your function code here!
  final supabase = Supabase.instance.client;

  // 1. Usamos un nombre de canal único para evitar conflictos
  final channel = supabase.channel('public:$table');

  channel
      .onPostgresChanges(
        event: PostgresChangeEvent.all, // Escucha INSERT, UPDATE y DELETE
        schema: 'public',
        table: table,
        callback: (PostgresChangePayload payload) async {
          // 2. Ejecutamos la acción que pasaste por parámetro
          await action();
          print("Realtime: Cambio detectado en $table y acción ejecutada.");
        },
      )
      .subscribe();

  print("Suscrito exitosamente a la tabla: $table");
}
