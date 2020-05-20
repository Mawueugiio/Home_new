// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Record _$RecordFromJson(Map<String, dynamic> json) {
  return Record(
    json['id'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$RecordToJson(Record instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
