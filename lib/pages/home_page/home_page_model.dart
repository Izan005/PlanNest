import '/backend/supabase/supabase.dart';
import '/components/bottom_card_note/bottom_card_note_widget.dart';
import '/components/bottom_card_task/bottom_card_task_widget.dart';
import '/components/note_preview_card/note_preview_card_widget.dart';
import '/components/task_component/task_component_widget.dart';
import '/components/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getOneSignalId] action in HomePage widget.
  String? onesignalId;
  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<TaskRow>? tareasUserDb;
  // Stores action output result for [Backend Call - Query Rows] action in HomePage widget.
  List<NoteRow>? notasDb;
  // Model for TopBar component.
  late TopBarModel topBarModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - Query Rows] action in ListView widget.
  List<TaskRow>? tareasUserDbRefresh;
  // Models for TaskComponent dynamic component.
  late FlutterFlowDynamicModels<TaskComponentModel> taskComponentModels;
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
    taskComponentModels = FlutterFlowDynamicModels(() => TaskComponentModel());
    bottomCardTaskModel = createModel(context, () => BottomCardTaskModel());
    notePreviewCardModels =
        FlutterFlowDynamicModels(() => NotePreviewCardModel());
    bottomCardNoteModel = createModel(context, () => BottomCardNoteModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    taskComponentModels.dispose();
    bottomCardTaskModel.dispose();
    notePreviewCardModels.dispose();
    bottomCardNoteModel.dispose();
  }
}
