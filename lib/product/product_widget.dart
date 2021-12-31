import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    Key key,
    this.barcode,
  }) : super(key: key);

  final String barcode;

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              widget.barcode,
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.bodyText1,
            ),
            StreamBuilder<List<ProductRecord>>(
              stream: queryProductRecord(
                queryBuilder: (productRecord) => productRecord.where('barcode',
                    isNotEqualTo: widget.barcode),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.primaryColor,
                      ),
                    ),
                  );
                }
                List<ProductRecord> columnProductRecordList = snapshot.data;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(columnProductRecordList.length,
                      (columnIndex) {
                    final columnProductRecord =
                        columnProductRecordList[columnIndex];
                    return Text(
                      columnProductRecord.name,
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.bodyText1,
                    );
                  }),
                );
              },
            ),
            StreamBuilder<List<ProductRecord>>(
              stream: queryProductRecord(
                queryBuilder: (productRecord) =>
                    productRecord.where('barcode', isEqualTo: widget.barcode),
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        color: FlutterFlowTheme.primaryColor,
                      ),
                    ),
                  );
                }
                List<ProductRecord> columnProductRecordList = snapshot.data;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: List.generate(columnProductRecordList.length,
                      (columnIndex) {
                    final columnProductRecord =
                        columnProductRecordList[columnIndex];
                    return Text(
                      columnProductRecord.calorie.toString(),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.bodyText1,
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
