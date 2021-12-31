import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'product_record.g.dart';

abstract class ProductRecord
    implements Built<ProductRecord, ProductRecordBuilder> {
  static Serializer<ProductRecord> get serializer => _$productRecordSerializer;

  @nullable
  String get name;

  @nullable
  String get barcode;

  @nullable
  double get calorie;

  @nullable
  double get points;

  @nullable
  String get brand;

  @nullable
  int get bar;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProductRecordBuilder builder) => builder
    ..name = ''
    ..barcode = ''
    ..calorie = 0.0
    ..points = 0.0
    ..brand = ''
    ..bar = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product');

  static Stream<ProductRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProductRecord._();
  factory ProductRecord([void Function(ProductRecordBuilder) updates]) =
      _$ProductRecord;

  static ProductRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProductRecordData({
  String name,
  String barcode,
  double calorie,
  double points,
  String brand,
  int bar,
}) =>
    serializers.toFirestore(
        ProductRecord.serializer,
        ProductRecord((p) => p
          ..name = name
          ..barcode = barcode
          ..calorie = calorie
          ..points = points
          ..brand = brand
          ..bar = bar));
