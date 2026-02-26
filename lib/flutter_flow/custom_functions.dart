import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

Color prioridadColor(String prioridad) {
  final p = prioridad.toLowerCase();

  switch (p) {
    case 'alta':
      return Color(0xFFFF4D4D); // Rojo vibrante pero elegante
    case 'media':
      return Color(0xFFFFD60A); // Amarillo ámbar/dorado
    case 'baja':
      return Color(0xFF32D74B); // Verde claro tipo iOS Dark Mode
    default:
      return Color(0xFF95A1AC); // Gris neutro si no hay coincidencia
  }
}

Color prioridadSeleccionada(
  String prioridadButton,
  String prioridadState,
) {
  final pB = prioridadButton.toLowerCase();

  final pS = prioridadState.toLowerCase();

  if (pB == pS) return Colors.white.withOpacity(0.4);

  return Colors.transparent;
}

String primeraLetraUser(String user) {
  return user.split("")[0].toUpperCase();
}
