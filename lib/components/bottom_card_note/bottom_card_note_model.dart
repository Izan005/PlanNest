import '/flutter_flow/flutter_flow_util.dart';
import 'bottom_card_note_widget.dart' show BottomCardNoteWidget;
import 'package:flutter/material.dart';

class BottomCardNoteModel extends FlutterFlowModel<BottomCardNoteWidget> {
  ///  Local state fields for this component.

  bool mostrarPanel = false;

  bool expanded = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
