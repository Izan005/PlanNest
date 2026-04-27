import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'user_page_widget.dart' show UserPageWidget;
import 'package:flutter/material.dart';

class UserPageModel extends FlutterFlowModel<UserPageWidget> {
  ///  Local state fields for this page.

  int createdTasks = 0;

  int createdNotes = 0;

  int atTimeTasks = 0;

  int outdatedTasks = 0;

  int? noCompletedTasks;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in UserPage widget.
  List<TaskRow>? createdTasksDb;
  // Stores action output result for [Backend Call - Query Rows] action in UserPage widget.
  List<NoteRow>? createdNotesDb;
  // Stores action output result for [Backend Call - Query Rows] action in UserPage widget.
  List<TaskRow>? atTimeDb;
  // Stores action output result for [Backend Call - Query Rows] action in UserPage widget.
  List<TaskRow>? outdatedDb;
  // Stores action output result for [Backend Call - Query Rows] action in UserPage widget.
  List<TaskRow>? noCompletedDb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
