import '/backend/supabase/supabase.dart';
import '/components/bottom_card_note/bottom_card_note_widget.dart';
import '/components/bottom_card_task/bottom_card_task_widget.dart';
import '/components/note_preview_card/note_preview_card_widget.dart';
import '/components/task_component/task_component_widget.dart';
import '/components/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dart:async';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<TaskRow> tareasUser = [];
  void addToTareasUser(TaskRow item) => tareasUser.add(item);
  void removeFromTareasUser(TaskRow item) => tareasUser.remove(item);
  void removeAtIndexFromTareasUser(int index) => tareasUser.removeAt(index);
  void insertAtIndexInTareasUser(int index, TaskRow item) =>
      tareasUser.insert(index, item);
  void updateTareasUserAtIndex(int index, Function(TaskRow) updateFn) =>
      tareasUser[index] = updateFn(tareasUser[index]);

  List<NoteRow> notasUser = [];
  void addToNotasUser(NoteRow item) => notasUser.add(item);
  void removeFromNotasUser(NoteRow item) => notasUser.remove(item);
  void removeAtIndexFromNotasUser(int index) => notasUser.removeAt(index);
  void insertAtIndexInNotasUser(int index, NoteRow item) =>
      notasUser.insert(index, item);
  void updateNotasUserAtIndex(int index, Function(NoteRow) updateFn) =>
      notasUser[index] = updateFn(notasUser[index]);

  bool multipleSelectedNotes = false;

  int? totalSelected;

  String? onesignalIdPage;

  List<TaskRow> sharedTasks = [];
  void addToSharedTasks(TaskRow item) => sharedTasks.add(item);
  void removeFromSharedTasks(TaskRow item) => sharedTasks.remove(item);
  void removeAtIndexFromSharedTasks(int index) => sharedTasks.removeAt(index);
  void insertAtIndexInSharedTasks(int index, TaskRow item) =>
      sharedTasks.insert(index, item);
  void updateSharedTasksAtIndex(int index, Function(TaskRow) updateFn) =>
      sharedTasks[index] = updateFn(sharedTasks[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<UserRow>? createdUserDb;
  // Stores action output result for [Custom Action - getOneSignalId] action in HomePage widget.
  String? onesignalId;
  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<TaskRow>? tareasUserDb;
  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<NoteRow>? notasDb;
  // Stores action output result for [Custom Action - showSharedTasks] action in HomePage widget.
  List<TaskRow>? sharedTasksDb;
  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<TaskRow>? tareasUserDb1;
  // Stores action output result for [Custom Action - showSharedTasks] action in HomePage widget.
  List<TaskRow>? sharedTasksDb1;
  Completer<List<UserRow>>? requestCompleter;
  // Model for TopBar component.
  late TopBarModel topBarModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Custom Action - showSharedTasks] action in ListView widget.
  List<TaskRow>? sharedTasksDbRefresh;
  // Stores action output result for [Backend Call - Query Rows] action in ListView widget.
  List<TaskRow>? tareasUserDbRefresh;
  // Models for TaskComponent dynamic component.
  late FlutterFlowDynamicModels<TaskComponentModel> taskComponentModels2;
  // Model for BottomCardTask component.
  late BottomCardTaskModel bottomCardTaskModel;
  // Stores action output result for [Backend Call - Query Rows] action in GridView widget.
  List<NoteRow>? notasDbRefresh;
  // Models for NotePreviewCard dynamic component.
  late FlutterFlowDynamicModels<NotePreviewCardModel> notePreviewCardModels;
  // Model for BottomCardNote component.
  late BottomCardNoteModel bottomCardNoteModel;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
    taskComponentModels2 = FlutterFlowDynamicModels(() => TaskComponentModel());
    bottomCardTaskModel = createModel(context, () => BottomCardTaskModel());
    notePreviewCardModels =
        FlutterFlowDynamicModels(() => NotePreviewCardModel());
    bottomCardNoteModel = createModel(context, () => BottomCardNoteModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    taskComponentModels2.dispose();
    bottomCardTaskModel.dispose();
    notePreviewCardModels.dispose();
    bottomCardNoteModel.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
