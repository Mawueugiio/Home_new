import 'package:beta_project/domain/entities/record.dart';
import 'package:json_annotation/json_annotation.dart';

part 'record.g.dart';

@JsonSerializable()
class Record extends RecordEntity {
  Record(String id, String name) : super(id, name);

  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);

  Map<String, dynamic> toJson() => _$RecordToJson(this);
}
