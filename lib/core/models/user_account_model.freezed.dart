// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAccountModel _$UserAccountModelFromJson(Map<String, dynamic> json) {
  return _UserAccountModel.fromJson(json);
}

/// @nodoc
mixin _$UserAccountModel {
  String get userID => throw _privateConstructorUsedError;
  List<ContactsModel>? get contacts => throw _privateConstructorUsedError;
  List<UserInterests>? get interests => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserAccountModelCopyWith<UserAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAccountModelCopyWith<$Res> {
  factory $UserAccountModelCopyWith(
          UserAccountModel value, $Res Function(UserAccountModel) then) =
      _$UserAccountModelCopyWithImpl<$Res>;
  $Res call(
      {String userID,
      List<ContactsModel>? contacts,
      List<UserInterests>? interests});
}

/// @nodoc
class _$UserAccountModelCopyWithImpl<$Res>
    implements $UserAccountModelCopyWith<$Res> {
  _$UserAccountModelCopyWithImpl(this._value, this._then);

  final UserAccountModel _value;
  // ignore: unused_field
  final $Res Function(UserAccountModel) _then;

  @override
  $Res call({
    Object? userID = freezed,
    Object? contacts = freezed,
    Object? interests = freezed,
  }) {
    return _then(_value.copyWith(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      contacts: contacts == freezed
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<ContactsModel>?,
      interests: interests == freezed
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<UserInterests>?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserAccountModelCopyWith<$Res>
    implements $UserAccountModelCopyWith<$Res> {
  factory _$$_UserAccountModelCopyWith(
          _$_UserAccountModel value, $Res Function(_$_UserAccountModel) then) =
      __$$_UserAccountModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userID,
      List<ContactsModel>? contacts,
      List<UserInterests>? interests});
}

/// @nodoc
class __$$_UserAccountModelCopyWithImpl<$Res>
    extends _$UserAccountModelCopyWithImpl<$Res>
    implements _$$_UserAccountModelCopyWith<$Res> {
  __$$_UserAccountModelCopyWithImpl(
      _$_UserAccountModel _value, $Res Function(_$_UserAccountModel) _then)
      : super(_value, (v) => _then(v as _$_UserAccountModel));

  @override
  _$_UserAccountModel get _value => super._value as _$_UserAccountModel;

  @override
  $Res call({
    Object? userID = freezed,
    Object? contacts = freezed,
    Object? interests = freezed,
  }) {
    return _then(_$_UserAccountModel(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
      contacts: contacts == freezed
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<ContactsModel>?,
      interests: interests == freezed
          ? _value._interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<UserInterests>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAccountModel implements _UserAccountModel {
  _$_UserAccountModel(
      {required this.userID,
      final List<ContactsModel>? contacts,
      final List<UserInterests>? interests})
      : _contacts = contacts,
        _interests = interests;

  factory _$_UserAccountModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserAccountModelFromJson(json);

  @override
  final String userID;
  final List<ContactsModel>? _contacts;
  @override
  List<ContactsModel>? get contacts {
    final value = _contacts;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UserInterests>? _interests;
  @override
  List<UserInterests>? get interests {
    final value = _interests;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'UserAccountModel(userID: $userID, contacts: $contacts, interests: $interests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAccountModel &&
            const DeepCollectionEquality().equals(other.userID, userID) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            const DeepCollectionEquality()
                .equals(other._interests, _interests));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userID),
      const DeepCollectionEquality().hash(_contacts),
      const DeepCollectionEquality().hash(_interests));

  @JsonKey(ignore: true)
  @override
  _$$_UserAccountModelCopyWith<_$_UserAccountModel> get copyWith =>
      __$$_UserAccountModelCopyWithImpl<_$_UserAccountModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserAccountModelToJson(
      this,
    );
  }
}

abstract class _UserAccountModel implements UserAccountModel {
  factory _UserAccountModel(
      {required final String userID,
      final List<ContactsModel>? contacts,
      final List<UserInterests>? interests}) = _$_UserAccountModel;

  factory _UserAccountModel.fromJson(Map<String, dynamic> json) =
      _$_UserAccountModel.fromJson;

  @override
  String get userID;
  @override
  List<ContactsModel>? get contacts;
  @override
  List<UserInterests>? get interests;
  @override
  @JsonKey(ignore: true)
  _$$_UserAccountModelCopyWith<_$_UserAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ContactsModel _$ContactsModelFromJson(Map<String, dynamic> json) {
  return _ContactsModel.fromJson(json);
}

/// @nodoc
mixin _$ContactsModel {
  String get name => throw _privateConstructorUsedError;
  String get eWalletID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContactsModelCopyWith<ContactsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactsModelCopyWith<$Res> {
  factory $ContactsModelCopyWith(
          ContactsModel value, $Res Function(ContactsModel) then) =
      _$ContactsModelCopyWithImpl<$Res>;
  $Res call({String name, String eWalletID});
}

/// @nodoc
class _$ContactsModelCopyWithImpl<$Res>
    implements $ContactsModelCopyWith<$Res> {
  _$ContactsModelCopyWithImpl(this._value, this._then);

  final ContactsModel _value;
  // ignore: unused_field
  final $Res Function(ContactsModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? eWalletID = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      eWalletID: eWalletID == freezed
          ? _value.eWalletID
          : eWalletID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_ContactsModelCopyWith<$Res>
    implements $ContactsModelCopyWith<$Res> {
  factory _$$_ContactsModelCopyWith(
          _$_ContactsModel value, $Res Function(_$_ContactsModel) then) =
      __$$_ContactsModelCopyWithImpl<$Res>;
  @override
  $Res call({String name, String eWalletID});
}

/// @nodoc
class __$$_ContactsModelCopyWithImpl<$Res>
    extends _$ContactsModelCopyWithImpl<$Res>
    implements _$$_ContactsModelCopyWith<$Res> {
  __$$_ContactsModelCopyWithImpl(
      _$_ContactsModel _value, $Res Function(_$_ContactsModel) _then)
      : super(_value, (v) => _then(v as _$_ContactsModel));

  @override
  _$_ContactsModel get _value => super._value as _$_ContactsModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? eWalletID = freezed,
  }) {
    return _then(_$_ContactsModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      eWalletID: eWalletID == freezed
          ? _value.eWalletID
          : eWalletID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContactsModel implements _ContactsModel {
  _$_ContactsModel({required this.name, required this.eWalletID});

  factory _$_ContactsModel.fromJson(Map<String, dynamic> json) =>
      _$$_ContactsModelFromJson(json);

  @override
  final String name;
  @override
  final String eWalletID;

  @override
  String toString() {
    return 'ContactsModel(name: $name, eWalletID: $eWalletID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContactsModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.eWalletID, eWalletID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(eWalletID));

  @JsonKey(ignore: true)
  @override
  _$$_ContactsModelCopyWith<_$_ContactsModel> get copyWith =>
      __$$_ContactsModelCopyWithImpl<_$_ContactsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContactsModelToJson(
      this,
    );
  }
}

abstract class _ContactsModel implements ContactsModel {
  factory _ContactsModel(
      {required final String name,
      required final String eWalletID}) = _$_ContactsModel;

  factory _ContactsModel.fromJson(Map<String, dynamic> json) =
      _$_ContactsModel.fromJson;

  @override
  String get name;
  @override
  String get eWalletID;
  @override
  @JsonKey(ignore: true)
  _$$_ContactsModelCopyWith<_$_ContactsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
