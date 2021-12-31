import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculateWidget extends StatefulWidget {
  const CalculateWidget({Key key}) : super(key: key);

  @override
  _CalculateWidgetState createState() => _CalculateWidgetState();
}

class _CalculateWidgetState extends State<CalculateWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'قريباً!',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
