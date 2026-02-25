import '/flutter_flow/flutter_flow_util.dart';
import 'create_task_component_widget.dart' show CreateTaskComponentWidget;
import 'package:flutter/material.dart';

class CreateTaskComponentModel
    extends FlutterFlowModel<CreateTaskComponentWidget> {
  ///  Local state fields for this component.

  double? offsetY = -100.0;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
