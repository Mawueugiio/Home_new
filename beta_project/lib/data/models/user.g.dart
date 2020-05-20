// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['name'] as String,
    json['token'] as String,
    json['pin'] as String,
    json['avatar'] as String,
    json['lastSeen'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'token': instance.token,
      'pin': instance.pin,
      'avatar': instance.avatar,
      'lastSeen': instance.lastSeen,
    };
