import '/components/notification_card/notification_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_list_model.dart';
export 'notifications_list_model.dart';

/// quiero que hagas siguiendo el estilo de la app un componente desplegable
/// de notificaciones
class NotificationsListWidget extends StatefulWidget {
  const NotificationsListWidget({super.key});

  @override
  State<NotificationsListWidget> createState() =>
      _NotificationsListWidgetState();
}

class _NotificationsListWidgetState extends State<NotificationsListWidget>
    with TickerProviderStateMixin {
  late NotificationsListModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsListModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.notificationsDb = await actions.getNotifications(
        FFAppState().userLogged.id,
      );
      _model.notifications = _model.notificationsDb!.toList().cast<dynamic>();
      safeSetState(() {});
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
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
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF1D2428),
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                2.0,
              ),
              spreadRadius: 0.0,
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onVerticalDragDown: (details) async {
                  Navigator.pop(context);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 50.0,
                      child: Divider(
                        thickness: 1.5,
                        color: Color(0x79FFFFFF),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if ((_model.notifications.isNotEmpty) == true)
                                Text(
                                  'Notificaciones',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.interTight(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                ),
                            ].divide(SizedBox(width: 8.0)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if ((_model.notifications.isNotEmpty) == true)
                Flexible(
                  child: Builder(
                    builder: (context) {
                      final notificationsListView =
                          _model.notifications.toList();

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: notificationsListView.length,
                        separatorBuilder: (_, __) => SizedBox(height: 8.0),
                        itemBuilder: (context, notificationsListViewIndex) {
                          final notificationsListViewItem =
                              notificationsListView[notificationsListViewIndex];
                          return wrapWithModel(
                            model: _model.notificationCardModels.getModel(
                              getJsonField(
                                notificationsListViewItem,
                                r'''$.shared_id''',
                              ).toString(),
                              notificationsListViewIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: NotificationCardWidget(
                              key: Key(
                                'Key3ak_${getJsonField(
                                  notificationsListViewItem,
                                  r'''$.shared_id''',
                                ).toString()}',
                              ),
                              notification: notificationsListViewItem,
                              callback: () async {
                                _model.removeFromNotifications(
                                    notificationsListViewItem);
                                safeSetState(() {});
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              if ((_model.notifications.isNotEmpty) == false)
                Expanded(
                  child: Opacity(
                    opacity: 0.5,
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        'Notificaciones',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: Colors.white,
                              fontSize: 30.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation']!),
                    ),
                  ),
                ),
            ].divide(SizedBox(height: 16.0)),
          ),
        ),
      ),
    );
  }
}
