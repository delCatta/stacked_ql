// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      dni: json['dni'] as String?,
      name: json['name'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
      country: json['country'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdAt: json['createdAt'] as String?,
      email: json['email'] as String?,
      setup: json['setup'] as bool?,
      business: (json['business'] as List<dynamic>?)
          ?.map((e) => Business.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'dni': instance.dni,
      'name': instance.name,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'country': instance.country,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'email': instance.email,
      'setup': instance.setup,
      'business': instance.business,
    };

_$_Business _$$_BusinessFromJson(Map<String, dynamic> json) => _$_Business(
      id: json['id'] as String,
      email: json['email'] as String?,
      setup: json['setup'] as bool?,
    );

Map<String, dynamic> _$$_BusinessToJson(_$_Business instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'setup': instance.setup,
    };
