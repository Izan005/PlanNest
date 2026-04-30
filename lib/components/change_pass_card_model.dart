import '/flutter_flow/flutter_flow_util.dart';
import 'change_pass_card_widget.dart' show ChangePassCardWidget;
import 'package:flutter/material.dart';

class ChangePassCardModel extends FlutterFlowModel<ChangePassCardWidget> {
  ///  Local state fields for this component.

  bool passLength = true;

  bool coinciden = true;

  ///  State fields for stateful widgets in this component.

  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode1;
  TextEditingController? passwordCreateTextController1;
  late bool passwordCreateVisibility1;
  String? Function(BuildContext, String?)?
      passwordCreateTextController1Validator;
  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode2;
  TextEditingController? passwordCreateTextController2;
  late bool passwordCreateVisibility2;
  String? Function(BuildContext, String?)?
      passwordCreateTextController2Validator;

  @override
  void initState(BuildContext context) {
    passwordCreateVisibility1 = false;
    passwordCreateVisibility2 = false;
  }

  @override
  void dispose() {
    passwordCreateFocusNode1?.dispose();
    passwordCreateTextController1?.dispose();

    passwordCreateFocusNode2?.dispose();
    passwordCreateTextController2?.dispose();
  }
}
