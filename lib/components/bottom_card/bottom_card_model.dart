import '/flutter_flow/flutter_flow_util.dart';
import 'bottom_card_widget.dart' show BottomCardWidget;
import 'package:flutter/material.dart';

class BottomCardModel extends FlutterFlowModel<BottomCardWidget> {
  ///  Local state fields for this component.

  bool mostrarPanel = false;

  DateTime? fechaLimite;

  String prioridad = 'baja';

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
