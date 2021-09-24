import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_models.freezed.dart';
part 'app_models.g.dart';

@freezed
class User with _$User {
  User._();
  factory User({
    required String id,
    String? dni,
    String? name,
    String? lastName,
    String? phone,
    String? country,
    String? updatedAt,
    String? createdAt,
    String? email,
    bool? setup,
    List<Business>? business,
  }) = _User;

  bool get hasInitializedBusiness => business != null;
  bool get hasBusiness => hasInitializedBusiness && business!.isNotEmpty;
  Business? get firstBusiness => business?.first;
  Map<String, dynamic> get setupFields =>
      toJson()..removeWhere((key, value) => value != null);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class Business with _$Business {
  factory Business({
    required String id,
    String? email,
    bool? setup,
  }) = _Business;

  factory Business.fromJson(Map<String, dynamic> json) =>
      _$BusinessFromJson(json);
}
