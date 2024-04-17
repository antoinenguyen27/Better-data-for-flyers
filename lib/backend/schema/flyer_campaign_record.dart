import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlyerCampaignRecord extends FirestoreRecord {
  FlyerCampaignRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "storeID" field.
  String? _storeID;
  String get storeID => _storeID ?? '';
  bool hasStoreID() => _storeID != null;

  // "totalConversions" field.
  int? _totalConversions;
  int get totalConversions => _totalConversions ?? 0;
  bool hasTotalConversions() => _totalConversions != null;

  // "conversionsPerDay" field.
  List<int>? _conversionsPerDay;
  List<int> get conversionsPerDay => _conversionsPerDay ?? const [];
  bool hasConversionsPerDay() => _conversionsPerDay != null;

  // "storeRef" field.
  DocumentReference? _storeRef;
  DocumentReference? get storeRef => _storeRef;
  bool hasStoreRef() => _storeRef != null;

  // "storeLink" field.
  String? _storeLink;
  String get storeLink => _storeLink ?? '';
  bool hasStoreLink() => _storeLink != null;

  // "exactLocationEnabled" field.
  bool? _exactLocationEnabled;
  bool get exactLocationEnabled => _exactLocationEnabled ?? false;
  bool hasExactLocationEnabled() => _exactLocationEnabled != null;

  // "approximateLocationEnabled" field.
  bool? _approximateLocationEnabled;
  bool get approximateLocationEnabled => _approximateLocationEnabled ?? false;
  bool hasApproximateLocationEnabled() => _approximateLocationEnabled != null;

  // "hasSurvey" field.
  bool? _hasSurvey;
  bool get hasSurvey => _hasSurvey ?? false;
  bool hasHasSurvey() => _hasSurvey != null;

  // "areaCode" field.
  String? _areaCode;
  String get areaCode => _areaCode ?? '';
  bool hasAreaCode() => _areaCode != null;

  // "campaignID" field.
  String? _campaignID;
  String get campaignID => _campaignID ?? '';
  bool hasCampaignID() => _campaignID != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _storeID = snapshotData['storeID'] as String?;
    _totalConversions = castToType<int>(snapshotData['totalConversions']);
    _conversionsPerDay = getDataList(snapshotData['conversionsPerDay']);
    _storeRef = snapshotData['storeRef'] as DocumentReference?;
    _storeLink = snapshotData['storeLink'] as String?;
    _exactLocationEnabled = snapshotData['exactLocationEnabled'] as bool?;
    _approximateLocationEnabled =
        snapshotData['approximateLocationEnabled'] as bool?;
    _hasSurvey = snapshotData['hasSurvey'] as bool?;
    _areaCode = snapshotData['areaCode'] as String?;
    _campaignID = snapshotData['campaignID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('flyerCampaign');

  static Stream<FlyerCampaignRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FlyerCampaignRecord.fromSnapshot(s));

  static Future<FlyerCampaignRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FlyerCampaignRecord.fromSnapshot(s));

  static FlyerCampaignRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FlyerCampaignRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FlyerCampaignRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FlyerCampaignRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FlyerCampaignRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FlyerCampaignRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFlyerCampaignRecordData({
  String? name,
  String? storeID,
  int? totalConversions,
  DocumentReference? storeRef,
  String? storeLink,
  bool? exactLocationEnabled,
  bool? approximateLocationEnabled,
  bool? hasSurvey,
  String? areaCode,
  String? campaignID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'storeID': storeID,
      'totalConversions': totalConversions,
      'storeRef': storeRef,
      'storeLink': storeLink,
      'exactLocationEnabled': exactLocationEnabled,
      'approximateLocationEnabled': approximateLocationEnabled,
      'hasSurvey': hasSurvey,
      'areaCode': areaCode,
      'campaignID': campaignID,
    }.withoutNulls,
  );

  return firestoreData;
}

class FlyerCampaignRecordDocumentEquality
    implements Equality<FlyerCampaignRecord> {
  const FlyerCampaignRecordDocumentEquality();

  @override
  bool equals(FlyerCampaignRecord? e1, FlyerCampaignRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.storeID == e2?.storeID &&
        e1?.totalConversions == e2?.totalConversions &&
        listEquality.equals(e1?.conversionsPerDay, e2?.conversionsPerDay) &&
        e1?.storeRef == e2?.storeRef &&
        e1?.storeLink == e2?.storeLink &&
        e1?.exactLocationEnabled == e2?.exactLocationEnabled &&
        e1?.approximateLocationEnabled == e2?.approximateLocationEnabled &&
        e1?.hasSurvey == e2?.hasSurvey &&
        e1?.areaCode == e2?.areaCode &&
        e1?.campaignID == e2?.campaignID;
  }

  @override
  int hash(FlyerCampaignRecord? e) => const ListEquality().hash([
        e?.name,
        e?.storeID,
        e?.totalConversions,
        e?.conversionsPerDay,
        e?.storeRef,
        e?.storeLink,
        e?.exactLocationEnabled,
        e?.approximateLocationEnabled,
        e?.hasSurvey,
        e?.areaCode,
        e?.campaignID
      ]);

  @override
  bool isValidKey(Object? o) => o is FlyerCampaignRecord;
}
