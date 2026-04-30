import '/flutter_flow/flutter_flow_util.dart';
import 'notification_card_widget.dart' show NotificationCardWidget;
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';

class NotificationCardModel extends FlutterFlowModel<NotificationCardWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for FlippableCard widget.
  final flippableCardController = FlipCardController();
  bool flippableCardIsFront = true;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
