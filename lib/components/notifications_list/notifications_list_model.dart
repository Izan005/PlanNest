import '/flutter_flow/flutter_flow_util.dart';
import 'notifications_list_widget.dart' show NotificationsListWidget;
import 'package:flutter/material.dart';

class NotificationsListModel extends FlutterFlowModel<NotificationsListWidget> {
  ///  Local state fields for this component.

  List<dynamic> notifications = [];
  void addToNotifications(dynamic item) => notifications.add(item);
  void removeFromNotifications(dynamic item) => notifications.remove(item);
  void removeAtIndexFromNotifications(int index) =>
      notifications.removeAt(index);
  void insertAtIndexInNotifications(int index, dynamic item) =>
      notifications.insert(index, item);
  void updateNotificationsAtIndex(int index, Function(dynamic) updateFn) =>
      notifications[index] = updateFn(notifications[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - getNotifications] action in NotificationsList widget.
  List<dynamic>? notificationsDb;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
