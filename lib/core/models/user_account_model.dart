import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meworld/views/screens/account_sign_up.dart';

part 'user_account_model.freezed.dart';
part 'user_account_model.g.dart';

@freezed
class UserAccountModel with _$UserAccountModel {
  factory UserAccountModel(
      {required String userID,
      List<ContactsModel>? contacts,
      List<UserInterests>? interests}) = _UserAccountModel;
  factory UserAccountModel.fromJson(Map<String, dynamic> json) =>
      _$UserAccountModelFromJson(json);
}

@freezed
class ContactsModel with _$ContactsModel {
  factory ContactsModel({required String name, required String eWalletID}) =
      _ContactsModel;

  factory ContactsModel.fromJson(Map<String, dynamic> json) =>
      _$ContactsModelFromJson(json);
}
