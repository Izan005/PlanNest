import '/backend/supabase/supabase.dart';
import '/components/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool mostrarPanel = false;

  DateTime? fechaLimite;

  String prioridad = 'baja';

  List<TaskRow> tareasUser = [];
  void addToTareasUser(TaskRow item) => tareasUser.add(item);
  void removeFromTareasUser(TaskRow item) => tareasUser.remove(item);
  void removeAtIndexFromTareasUser(int index) => tareasUser.removeAt(index);
  void insertAtIndexInTareasUser(int index, TaskRow item) =>
      tareasUser.insert(index, item);
  void updateTareasUserAtIndex(int index, Function(TaskRow) updateFn) =>
      tareasUser[index] = updateFn(tareasUser[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<TaskRow>? tareasUserDb;
  // Model for TopBar component.
  late TopBarModel topBarModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
