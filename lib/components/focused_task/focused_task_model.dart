import '/flutter_flow/flutter_flow_util.dart';
import 'focused_task_widget.dart' show FocusedTaskWidget;
import 'package:flutter/material.dart';

class FocusedTaskModel extends FlutterFlowModel<FocusedTaskWidget> {
  ///  Local state fields for this component.

  String prioridad = 'baja';

  DateTime? fechaLimite;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
