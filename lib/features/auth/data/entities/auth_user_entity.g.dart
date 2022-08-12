// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthUserEntityAdapter extends TypeAdapter<AuthUserEntity> {
  @override
  final int typeId = 12;

  @override
  AuthUserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthUserEntity(
      id: fields[0] as String,
      phoneNumber: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AuthUserEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthUserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthUserEntity _$AuthUserEntityFromJson(Map json) => AuthUserEntity(
      id: json['id'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$AuthUserEntityToJson(AuthUserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
    };
