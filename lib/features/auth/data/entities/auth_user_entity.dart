import 'package:exer_log_revamp/core/data/local/hive_constants.dart';
import 'package:exer_log_revamp/features/auth/domain/model/auth_user.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_user_entity.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
@HiveType(typeId: authUserHiveType)
class AuthUserEntity implements AuthUser {
  @HiveField(0)
  @override
  String id;

  @HiveField(1)
  @override
  String phoneNumber;

  AuthUserEntity({required this.id, required this.phoneNumber});

  factory AuthUserEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthUserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AuthUserEntityToJson(this);
}
