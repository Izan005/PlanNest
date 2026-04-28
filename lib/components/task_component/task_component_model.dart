import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'task_component_widget.dart' show TaskComponentWidget;
import 'package:flutter/material.dart';

class TaskComponentModel extends FlutterFlowModel<TaskComponentWidget> {
  ///  Local state fields for this component.

  bool sidebar = false;

  UserRow? owner;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in TaskComponent widget.
  List<UserRow>? ownerDb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
