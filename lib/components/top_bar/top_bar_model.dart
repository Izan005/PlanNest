import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'top_bar_widget.dart' show TopBarWidget;
import 'package:flutter/material.dart';

class TopBarModel extends FlutterFlowModel<TopBarWidget> {
  ///  Local state fields for this component.

  bool notifications = false;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in TopBar widget.
  List<SharedItemsRow>? notificationsDb1;
  // Stores action output result for [Backend Call - Query Rows] action in TopBar widget.
  List<SharedItemsRow>? notificationsDb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
