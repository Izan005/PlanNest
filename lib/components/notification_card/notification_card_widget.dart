import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notification_card_model.dart';
export 'notification_card_model.dart';

class NotificationCardWidget extends StatefulWidget {
  const NotificationCardWidget({
    super.key,
    required this.notification,
    required this.callback,
  });

  final dynamic notification;
  final Future Function()? callback;

  @override
  State<NotificationCardWidget> createState() => _NotificationCardWidgetState();
}

class _NotificationCardWidgetState extends State<NotificationCardWidget>
    with TickerProviderStateMixin {
  late NotificationCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationCardModel());

    animationsMap.addAll({
      'flippableCardOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
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
    return FlipCard(
      fill: Fill.fillBack,
      controller: _model.flippableCardController,
      onFlip: () => _model.flippableCardIsFront = !_model.flippableCardIsFront,
      direction: FlipDirection.HORIZONTAL,
      speed: 400,
      front: Container(
        width: double.infinity,
        height: 110.0,
        decoration: BoxDecoration(
          color: Color(0xFF14181B),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 44.0,
                height: 44.0,
                decoration: BoxDecoration(
                  color: getJsonField(
                            widget.notification,
                            r'''$.task_name''',
                          ) !=
                          null
                      ? Color(0x4C4B39EF)
                      : Color(0x4CEFB739),
                  borderRadius: BorderRadius.circular(22.0),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (getJsonField(
                          widget.notification,
                          r'''$.note_name''',
                        ) !=
                        null)
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.note,
                            color: getJsonField(
                                      widget.notification,
                                      r'''$.task_name''',
                                    ) !=
                                    null
                                ? Color(0xFF4B39EF)
                                : Color(0xFFEFA639),
                            size: 20.0,
                          ),
                        ),
                      ),
                    if (getJsonField(
                          widget.notification,
                          r'''$.task_name''',
                        ) !=
                        null)
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FaIcon(
                            FontAwesomeIcons.tasks,
                            color: getJsonField(
                                      widget.notification,
                                      r'''$.task_name''',
                                    ) !=
                                    null
                                ? Color(0xFF4B39EF)
                                : Color(0xFFEFA639),
                            size: 20.0,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Invitación',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                        ),
                      ],
                    ),
                    Text(
                      '${getJsonField(
                        widget.notification,
                        r'''$.owner_name''',
                      ).toString()} te ha invitado a ${getJsonField(
                            widget.notification,
                            r'''$.note_name''',
                          ) != null ? getJsonField(
                          widget.notification,
                          r'''$.note_name''',
                        ).toString() : getJsonField(
                          widget.notification,
                          r'''$.task_name''',
                        ).toString()}',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .fontStyle,
                            ),
                            fontSize: 12.0,
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .fontStyle,
                          ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF08A908),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
        ),
      ),
      back: Container(
        width: double.infinity,
        height: 110.0,
        decoration: BoxDecoration(
          color: Color(0xFF14181B),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 44.0,
                height: 44.0,
                decoration: BoxDecoration(
                  color: getJsonField(
                            widget.notification,
                            r'''$.task_name''',
                          ) !=
                          null
                      ? Color(0x4C4B39EF)
                      : Color(0x4CEFB739),
                  borderRadius: BorderRadius.circular(22.0),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (getJsonField(
                          widget.notification,
                          r'''$.note_name''',
                        ) !=
                        null)
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Icon(
                            Icons.note,
                            color: getJsonField(
                                      widget.notification,
                                      r'''$.task_name''',
                                    ) !=
                                    null
                                ? Color(0xFF4B39EF)
                                : Color(0xFFEFA639),
                            size: 20.0,
                          ),
                        ),
                      ),
                    if (getJsonField(
                          widget.notification,
                          r'''$.task_name''',
                        ) !=
                        null)
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FaIcon(
                            FontAwesomeIcons.tasks,
                            color: getJsonField(
                                      widget.notification,
                                      r'''$.task_name''',
                                    ) !=
                                    null
                                ? Color(0xFF4B39EF)
                                : Color(0xFFEFA639),
                            size: 20.0,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Invitación',
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                    ),
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .fontStyle,
                                  ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: FFButtonWidget(
                              onPressed: () async {
                                await SharedItemsTable().delete(
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    getJsonField(
                                      widget.notification,
                                      r'''$.shared_id''',
                                    ),
                                  ),
                                );
                                await widget.callback?.call();
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Invitación rechazada',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).error,
                                  ),
                                );
                              },
                              text: 'Rechazar',
                              options: FFButtonOptions(
                                width: 80.0,
                                padding: EdgeInsets.all(8.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x0014181B),
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFFF5963),
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Color(0xFFFF5963),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          Flexible(
                            child: FFButtonWidget(
                              onPressed: () async {
                                await SharedItemsTable().update(
                                  data: {
                                    'accepted': true,
                                  },
                                  matchingRows: (rows) => rows.eqOrNull(
                                    'id',
                                    getJsonField(
                                      widget.notification,
                                      r'''$.shared_id''',
                                    ),
                                  ),
                                );
                                await widget.callback?.call();
                                ScaffoldMessenger.of(context).clearSnackBars();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Invitación aceptada',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 4000),
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                );
                              },
                              text: 'Aceptar',
                              options: FFButtonOptions(
                                width: 80.0,
                                padding: EdgeInsets.all(8.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF4B39EF),
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).info,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ].divide(SizedBox(height: 4.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF08A908),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
            ].divide(SizedBox(width: 12.0)),
          ),
        ),
      ),
    ).animateOnPageLoad(animationsMap['flippableCardOnPageLoadAnimation']!);
  }
}
