import '/auth/supabase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/bottom_card_note/bottom_card_note_widget.dart';
import '/components/bottom_card_task/bottom_card_task_widget.dart';
import '/components/note_preview_card/note_preview_card_widget.dart';
import '/components/task_component/task_component_widget.dart';
import '/components/top_bar/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
    int? targetPage,
  }) : this.targetPage = targetPage ?? 1;

  final int targetPage;

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.createdUserDb = await UserTable().queryRows(
        queryFn: (q) => q.eqOrNull(
          'id',
          currentUserUid,
        ),
      );
      FFAppState().userLogged = UserStruct(
        id: _model.createdUserDb?.firstOrNull?.id,
        username: _model.createdUserDb?.firstOrNull?.username,
        email: currentUserEmail,
      );
      safeSetState(() {});
      await actions.initOneSignal(
        FFAppState().onesignalAppId,
      );
      _model.onesignalId = await actions.getOneSignalId();
      _model.onesignalIdPage = _model.onesignalId;
      safeSetState(() {});
      await UserTable().update(
        data: {
          'onesignal_id': _model.onesignalIdPage,
        },
        matchingRows: (rows) => rows.eqOrNull(
          'id',
          FFAppState().userLogged.id,
        ),
      );
      _model.tareasUserDb = await TaskTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'user_id',
              FFAppState().userLogged.id,
            )
            .isFilter(
              'completed_at_time',
              null,
            )
            .order('expiration_date')
            .order('id'),
      );
      _model.notasDb = await NoteTable().queryRows(
        queryFn: (q) => q
            .eqOrNull(
              'user_id',
              FFAppState().userLogged.id,
            )
            .order('created_at')
            .order('id'),
      );
      _model.tareasUser = _model.tareasUserDb!.toList().cast<TaskRow>();
      _model.notasUser = _model.notasDb!.toList().cast<NoteRow>();
      _model.totalSelected = FFAppState().selectedNoteIds.length;
      safeSetState(() {});
      await Future.wait([
        Future(() async {
          _model.sharedTasksDb = await actions.showSharedTasks(
            FFAppState().userLogged.id,
          );
          await actions.disconnectRealtime(
            'task',
          );
          await Future.delayed(
            Duration(
              milliseconds: 1000,
            ),
          );
          await actions.connectRealtime(
            'task',
            () async {
              safeSetState(() => _model.requestCompleter = null);
              await _model.waitForRequestCompleted();
              _model.sharedTasksDb1 = await actions.showSharedTasks(
                FFAppState().userLogged.id,
              );
              _model.tareasUserDb1 = await TaskTable().queryRows(
                queryFn: (q) => q
                    .eqOrNull(
                      'user_id',
                      FFAppState().userLogged.id,
                    )
                    .isFilter(
                      'completed_at_time',
                      null,
                    )
                    .order('expiration_date')
                    .order('id'),
              );
              _model.sharedTasks =
                  _model.sharedTasksDb1!.toList().cast<TaskRow>();
              _model.tareasUser =
                  _model.tareasUserDb1!.toList().cast<TaskRow>();
              safeSetState(() {});
            },
          );
        }),
        Future(() async {
          _model.sharedNotesDb = await actions.showSharedNotes(
            FFAppState().userLogged.id,
          );
          await actions.disconnectRealtime(
            'note',
          );
          await Future.delayed(
            Duration(
              milliseconds: 1000,
            ),
          );
          await actions.connectRealtime(
            'note',
            () async {
              safeSetState(() => _model.requestCompleter = null);
              await _model.waitForRequestCompleted();
              _model.sharedNotesDb1 = await actions.showSharedNotes(
                FFAppState().userLogged.id,
              );
              _model.notasUserDb1 = await NoteTable().queryRows(
                queryFn: (q) => q
                    .eqOrNull(
                      'user_id',
                      FFAppState().userLogged.id,
                    )
                    .order('id'),
              );
              _model.sharedNotes =
                  _model.sharedNotesDb1!.toList().cast<NoteRow>();
              _model.notasUser = _model.notasUserDb1!.toList().cast<NoteRow>();
              safeSetState(() {});
            },
          );
        }),
      ]);
      _model.sharedTasks = _model.sharedTasksDb!.toList().cast<TaskRow>();
      _model.sharedNotes = _model.sharedNotesDb!.toList().cast<NoteRow>();
      safeSetState(() {});
    });

    animationsMap.addAll({
      'notePreviewCardOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, -100.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'notePreviewCardOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(-100.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'notePreviewCardOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            hz: 5,
            offset: Offset(0.0, 0.0),
            rotation: 0.035,
          ),
        ],
      ),
      'iconOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<UserRow>>(
      future: (_model.requestCompleter ??= Completer<List<UserRow>>()
            ..complete(UserTable().querySingleRow(
              queryFn: (q) => q,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UserRow> homePageUserRowList = snapshot.data!;

        final homePageUserRow =
            homePageUserRowList.isNotEmpty ? homePageUserRowList.first : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.black,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.topBarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: TopBarWidget(),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 500.0,
                      child: PageView(
                        controller: _model.pageViewController ??=
                            PageController(
                                initialPage: max(
                                    0,
                                    min(
                                        valueOrDefault<int>(
                                          widget.targetPage,
                                          0,
                                        ),
                                        2))),
                        scrollDirection: Axis.horizontal,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Colaboraciones',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0x91FFFFFF),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 10.0, 10.0),
                                      child: FlutterFlowChoiceChips(
                                        options: [
                                          ChipData('Tareas'),
                                          ChipData('Notas')
                                        ],
                                        onChanged: (val) => safeSetState(() =>
                                            _model.choiceChipsValue =
                                                val?.firstOrNull),
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor: Color(0x00FFFFFF),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          iconColor: Colors.white,
                                          iconSize: 20.0,
                                          elevation: 0.0,
                                          borderColor: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor: Color(0x0014181B),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          iconColor: Colors.white,
                                          iconSize: 16.0,
                                          elevation: 0.0,
                                          borderColor: Color(0x44FFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        chipSpacing: 8.0,
                                        rowSpacing: 8.0,
                                        multiselect: false,
                                        initialized:
                                            _model.choiceChipsValue != null,
                                        alignment: WrapAlignment.start,
                                        controller: _model
                                                .choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                          ['Tareas'],
                                        ),
                                        wrapped: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (_model.choiceChipsValue == 'Tareas')
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final sharedTasksListView =
                                            _model.sharedTasks.toList();

                                        return RefreshIndicator(
                                          onRefresh: () async {
                                            _model.sharedTasksDbRefresh =
                                                await actions.showSharedTasks(
                                              FFAppState().userLogged.id,
                                            );
                                            _model.sharedTasks = _model
                                                .sharedTasksDbRefresh!
                                                .toList()
                                                .cast<TaskRow>();
                                            safeSetState(() {});
                                          },
                                          child: ListView.separated(
                                            padding: EdgeInsets.zero,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                sharedTasksListView.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 15.0),
                                            itemBuilder: (context,
                                                sharedTasksListViewIndex) {
                                              final sharedTasksListViewItem =
                                                  sharedTasksListView[
                                                      sharedTasksListViewIndex];
                                              return wrapWithModel(
                                                model: _model
                                                    .taskComponentModels1
                                                    .getModel(
                                                  sharedTasksListViewItem.id
                                                      .toString(),
                                                  sharedTasksListViewIndex,
                                                ),
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: TaskComponentWidget(
                                                  key: Key(
                                                    'Key4z0_${sharedTasksListViewItem.id.toString()}',
                                                  ),
                                                  tarea:
                                                      sharedTasksListViewItem,
                                                  isOwner: FFAppState()
                                                          .userLogged
                                                          .id ==
                                                      sharedTasksListViewItem
                                                          .userId,
                                                  targetPage: 0,
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              if (_model.choiceChipsValue == 'Notas')
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final sharedNotesGrid =
                                            _model.sharedNotes.toList();

                                        return RefreshIndicator(
                                          onRefresh: () async {
                                            _model.sharedNotesDbRefresh =
                                                await actions.showSharedNotes(
                                              FFAppState().userLogged.id,
                                            );
                                            _model.sharedNotes = _model
                                                .sharedNotesDbRefresh!
                                                .toList()
                                                .cast<NoteRow>();
                                            safeSetState(() {});
                                          },
                                          child: GridView.builder(
                                            padding: EdgeInsets.fromLTRB(
                                              0,
                                              20.0,
                                              0,
                                              140.0,
                                            ),
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10.0,
                                              mainAxisSpacing: 10.0,
                                              childAspectRatio: 1.0,
                                            ),
                                            scrollDirection: Axis.vertical,
                                            itemCount: sharedNotesGrid.length,
                                            itemBuilder: (context,
                                                sharedNotesGridIndex) {
                                              final sharedNotesGridItem =
                                                  sharedNotesGrid[
                                                      sharedNotesGridIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onLongPress: () async {
                                                  HapticFeedback.heavyImpact();
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'No eres el dueño',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  );
                                                },
                                                child: wrapWithModel(
                                                  model: _model
                                                      .notePreviewCardModels1
                                                      .getModel(
                                                    sharedNotesGridIndex
                                                        .toString(),
                                                    sharedNotesGridIndex,
                                                  ),
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: NotePreviewCardWidget(
                                                    key: Key(
                                                      'Keykzv_${sharedNotesGridIndex.toString()}',
                                                    ),
                                                    note: sharedNotesGridItem,
                                                    multipleSelected: _model
                                                        .multipleSelectedNotes,
                                                    targetPage: 0,
                                                    isOwner: sharedNotesGridItem
                                                            .userId ==
                                                        FFAppState()
                                                            .userLogged
                                                            .id,
                                                    callback: () async {
                                                      _model.totalSelected =
                                                          FFAppState()
                                                              .selectedNoteIds
                                                              .length;
                                                      safeSetState(() {});
                                                    },
                                                  ),
                                                ),
                                              ).animateOnPageLoad(animationsMap[
                                                  'notePreviewCardOnPageLoadAnimation1']!);
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await actions.ocultarTeclado();
                              },
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        if ((_model.tareasUser.isNotEmpty) ==
                                            false)
                                          Expanded(
                                            child: Opacity(
                                              opacity: 0.5,
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'Tareas',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 30.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'textOnPageLoadAnimation1']!),
                                              ),
                                            ),
                                          ),
                                        if ((_model.tareasUser.isNotEmpty) ==
                                            true)
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final tareasUserListView =
                                                      _model.tareasUser
                                                          .toList();

                                                  return RefreshIndicator(
                                                    onRefresh: () async {
                                                      _model.tareasUserDbRefresh =
                                                          await TaskTable()
                                                              .queryRows(
                                                        queryFn: (q) => q
                                                            .eqOrNull(
                                                              'user_id',
                                                              FFAppState()
                                                                  .userLogged
                                                                  .id,
                                                            )
                                                            .isFilter(
                                                              'completed_at_time',
                                                              null,
                                                            )
                                                            .order(
                                                                'expiration_date'),
                                                      );
                                                      _model.tareasUser = _model
                                                          .tareasUserDbRefresh!
                                                          .toList()
                                                          .cast<TaskRow>();
                                                      safeSetState(() {});
                                                    },
                                                    child: ListView.separated(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                        0,
                                                        20.0,
                                                        0,
                                                        140.0,
                                                      ),
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          tareasUserListView
                                                              .length,
                                                      separatorBuilder:
                                                          (_, __) => SizedBox(
                                                              height: 15.0),
                                                      itemBuilder: (context,
                                                          tareasUserListViewIndex) {
                                                        final tareasUserListViewItem =
                                                            tareasUserListView[
                                                                tareasUserListViewIndex];
                                                        return wrapWithModel(
                                                          model: _model
                                                              .taskComponentModels2
                                                              .getModel(
                                                            tareasUserListViewIndex
                                                                .toString(),
                                                            tareasUserListViewIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              TaskComponentWidget(
                                                            key: Key(
                                                              'Keyy88_${tareasUserListViewIndex.toString()}',
                                                            ),
                                                            tarea:
                                                                tareasUserListViewItem,
                                                            isOwner: true,
                                                            targetPage: 1,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: wrapWithModel(
                                        model: _model.bottomCardTaskModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: BottomCardTaskWidget(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (_model.multipleSelectedNotes == true)
                                Container(
                                  width: double.infinity,
                                  height: 30.1,
                                  decoration: BoxDecoration(
                                    color: Color(0x000B0C0D),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          _model.totalSelected!.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Text(
                                        ' Notas seleccionadas.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Flexible(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.multipleSelectedNotes =
                                                    !_model
                                                        .multipleSelectedNotes;
                                                _model.totalSelected = 0;
                                                safeSetState(() {});
                                                FFAppState().selectedNoteIds =
                                                    [];
                                                safeSetState(() {});
                                              },
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 35.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation']!),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Stack(
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if ((_model.notasUser.isNotEmpty) ==
                                              false)
                                            Expanded(
                                              child: Opacity(
                                                opacity: 0.5,
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    'Notas',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 30.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ).animateOnPageLoad(animationsMap[
                                                      'textOnPageLoadAnimation2']!),
                                                ),
                                              ),
                                            ),
                                          if ((_model.notasUser.isNotEmpty) ==
                                              true)
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final notasGrid = _model
                                                        .notasUser
                                                        .toList();

                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.multipleSelectedNotes =
                                                            !_model
                                                                .multipleSelectedNotes;
                                                        _model.totalSelected =
                                                            0;
                                                        safeSetState(() {});
                                                        FFAppState()
                                                            .selectedNoteIds = [];
                                                        safeSetState(() {});
                                                      },
                                                      child: RefreshIndicator(
                                                        onRefresh: () async {
                                                          _model.notasDbRefresh =
                                                              await NoteTable()
                                                                  .queryRows(
                                                            queryFn: (q) => q
                                                                .eqOrNull(
                                                                  'user_id',
                                                                  FFAppState()
                                                                      .userLogged
                                                                      .id,
                                                                )
                                                                .order(
                                                                    'created_at'),
                                                          );
                                                          _model.notasUser = _model
                                                              .notasDbRefresh!
                                                              .toList()
                                                              .cast<NoteRow>();
                                                          safeSetState(() {});
                                                        },
                                                        child: GridView.builder(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                            0,
                                                            20.0,
                                                            0,
                                                            140.0,
                                                          ),
                                                          gridDelegate:
                                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing:
                                                                10.0,
                                                            mainAxisSpacing:
                                                                10.0,
                                                            childAspectRatio:
                                                                1.0,
                                                          ),
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              notasGrid.length,
                                                          itemBuilder: (context,
                                                              notasGridIndex) {
                                                            final notasGridItem =
                                                                notasGrid[
                                                                    notasGridIndex];
                                                            return InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onLongPress:
                                                                  () async {
                                                                HapticFeedback
                                                                    .heavyImpact();
                                                                _model.multipleSelectedNotes =
                                                                    !_model
                                                                        .multipleSelectedNotes;
                                                                safeSetState(
                                                                    () {});
                                                                if (_model
                                                                    .multipleSelectedNotes) {
                                                                  if (animationsMap[
                                                                          'notePreviewCardOnActionTriggerAnimation'] !=
                                                                      null) {
                                                                    await animationsMap[
                                                                            'notePreviewCardOnActionTriggerAnimation']!
                                                                        .controller
                                                                        .forward(
                                                                            from:
                                                                                0.0);
                                                                  }
                                                                }
                                                              },
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .notePreviewCardModels2
                                                                    .getModel(
                                                                  notasGridIndex
                                                                      .toString(),
                                                                  notasGridIndex,
                                                                ),
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    NotePreviewCardWidget(
                                                                  key: Key(
                                                                    'Keyc0v_${notasGridIndex.toString()}',
                                                                  ),
                                                                  note:
                                                                      notasGridItem,
                                                                  multipleSelected:
                                                                      _model
                                                                          .multipleSelectedNotes,
                                                                  targetPage: 2,
                                                                  isOwner: notasGridItem
                                                                          .userId ==
                                                                      FFAppState()
                                                                          .userLogged
                                                                          .id,
                                                                  callback:
                                                                      () async {
                                                                    _model.totalSelected =
                                                                        FFAppState()
                                                                            .selectedNoteIds
                                                                            .length;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                              ),
                                                            )
                                                                .animateOnPageLoad(
                                                                    animationsMap[
                                                                        'notePreviewCardOnPageLoadAnimation2']!)
                                                                .animateOnActionTrigger(
                                                                  animationsMap[
                                                                      'notePreviewCardOnActionTriggerAnimation']!,
                                                                );
                                                          },
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                      if (_model.multipleSelectedNotes == false)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: wrapWithModel(
                                            model: _model.bottomCardNoteModel,
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: BottomCardNoteWidget(),
                                          ),
                                        ),
                                      if ((FFAppState()
                                              .selectedNoteIds
                                              .isNotEmpty) &&
                                          _model.multipleSelectedNotes)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 20.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                var confirmDialogResponse =
                                                    await showDialog<bool>(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Eliminar Notas'),
                                                              content: Text(functions
                                                                  .totalNotasSeleccionadasDelete(
                                                                      FFAppState()
                                                                          .selectedNoteIds
                                                                          .toList())),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                  child: Text(
                                                                      'Cancelar'),
                                                                ),
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                  child: Text(
                                                                      'Confirmar'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        ) ??
                                                        false;
                                                if (confirmDialogResponse) {
                                                  await NoteTable().delete(
                                                    matchingRows: (rows) =>
                                                        rows.inFilterOrNull(
                                                      'id',
                                                      FFAppState()
                                                          .selectedNoteIds,
                                                    ),
                                                  );

                                                  context.pushNamed(
                                                    HomePageWidget.routeName,
                                                    queryParameters: {
                                                      'targetPage':
                                                          serializeParam(
                                                        2,
                                                        ParamType.int,
                                                      ),
                                                    }.withoutNulls,
                                                  );

                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        functions.eliminadasNotas(
                                                            FFAppState()
                                                                .selectedNoteIds
                                                                .toList()),
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      duration: Duration(
                                                          milliseconds: 4000),
                                                      backgroundColor:
                                                          Colors.black,
                                                    ),
                                                  );
                                                  FFAppState().selectedNoteIds =
                                                      [];
                                                  safeSetState(() {});
                                                  _model.totalSelected = 0;
                                                  safeSetState(() {});
                                                }
                                              },
                                              child: FaIcon(
                                                FontAwesomeIcons.trashAlt,
                                                color: Color(0xFFDD1F1F),
                                                size: 50.0,
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'iconOnPageLoadAnimation']!),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
