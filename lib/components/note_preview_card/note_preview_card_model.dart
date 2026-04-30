import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'note_preview_card_widget.dart' show NotePreviewCardWidget;
import 'package:flutter/material.dart';

class NotePreviewCardModel extends FlutterFlowModel<NotePreviewCardWidget> {
  ///  Local state fields for this component.

  bool checkboxState = false;

  UserRow? owner;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in NotePreviewCard widget.
  List<UserRow>? ownerDb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
