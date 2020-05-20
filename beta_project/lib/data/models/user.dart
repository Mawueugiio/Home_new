import 'package:beta_project/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends UserEntity {
  const User(String name, String token, String pin, String avatar, int lastSeen)
      : super(name, token, pin, avatar, lastSeen);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
