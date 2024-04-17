import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({
    super.key,
    String? storeID,
    String? areaCode,
    String? campaignID,
  })  : this.storeID = storeID ?? '1',
        this.areaCode = areaCode ?? '1',
        this.campaignID = campaignID ?? '1';

  final String storeID;
  final String areaCode;
  final String campaignID;

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.flyerDoc = await queryFlyerCampaignRecordOnce(
        queryBuilder: (flyerCampaignRecord) => flyerCampaignRecord
            .where(
              'storeID',
              isEqualTo: widget.storeID,
            )
            .where(
              'areaCode',
              isEqualTo: widget.areaCode,
            )
            .where(
              'campaignID',
              isEqualTo: widget.campaignID,
            ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);

      await _model.flyerDoc!.reference.update({
        ...mapToFirestore(
          {
            'totalConversions': FieldValue.increment(1),
          },
        ),
      });
      await launchURL(_model.flyerDoc!.storeLink);
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Please wait while we load the site...',
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
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
  }
}
