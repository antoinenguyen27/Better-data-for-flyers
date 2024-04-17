import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaperboyStoreRecord extends FirestoreRecord {
  PaperboyStoreRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "storeName" field.
  String? _storeName;
  String get storeName => _storeName ?? '';
  bool hasStoreName() => _storeName != null;

  // "storeID" field.
  String? _storeID;
  String get storeID => _storeID ?? '';
  bool hasStoreID() => _storeID != null;

  // "storeRef" field.
  DocumentReference? _storeRef;
  DocumentReference? get storeRef => _storeRef;
  bool hasStoreRef() => _storeRef != null;

  // "storeLink" field.
  String? _storeLink;
  String get storeLink => _storeLink ?? '';
  bool hasStoreLink() => _storeLink != null;

  void _initializeFields() {
    _storeName = snapshotData['storeName'] as String?;
    _storeID = snapshotData['storeID'] as String?;
    _storeRef = snapshotData['storeRef'] as DocumentReference?;
    _storeLink = snapshotData['storeLink'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('paperboyStore');

  static Stream<PaperboyStoreRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaperboyStoreRecord.fromSnapshot(s));

  static Future<PaperboyStoreRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaperboyStoreRecord.fromSnapshot(s));

  static PaperboyStoreRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaperboyStoreRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaperboyStoreRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaperboyStoreRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaperboyStoreRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaperboyStoreRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaperboyStoreRecordData({
  String? storeName,
  String? storeID,
  DocumentReference? storeRef,
  String? storeLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'storeName': storeName,
      'storeID': storeID,
      'storeRef': storeRef,
      'storeLink': storeLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaperboyStoreRecordDocumentEquality
    implements Equality<PaperboyStoreRecord> {
  const PaperboyStoreRecordDocumentEquality();

  @override
  bool equals(PaperboyStoreRecord? e1, PaperboyStoreRecord? e2) {
    return e1?.storeName == e2?.storeName &&
        e1?.storeID == e2?.storeID &&
        e1?.storeRef == e2?.storeRef &&
        e1?.storeLink == e2?.storeLink;
  }

  @override
  int hash(PaperboyStoreRecord? e) => const ListEquality()
      .hash([e?.storeName, e?.storeID, e?.storeRef, e?.storeLink]);

  @override
  bool isValidKey(Object? o) => o is PaperboyStoreRecord;
}
