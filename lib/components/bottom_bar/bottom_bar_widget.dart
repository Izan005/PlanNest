import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bottom_bar_model.dart';
export 'bottom_bar_model.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  late BottomBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 2.0),
      child: Stack(
        alignment: AlignmentDirectional(0.0, 1.0),
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
          ),
          Material(
            color: Colors.transparent,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Container(
              width: 73.2,
              height: 69.6,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(
                  color: Color(0xFF8AD2FF),
                  width: 0.5,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.02, 1.05),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: SvgPicture.network(
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/prototipo-proyecto-final-1b4urw/assets/cnh5hymth8i4/Plan_Nest_Logo-nobg.svg',
                  width: 68.1,
                  height: 60.92,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Icon(
              Icons.add,
              color: Color(0xFF6E6E70),
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
