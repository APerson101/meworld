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
  $Res call({String userID, List<UserInterests>? interests});
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
    Object? interests = freezed,
  }) {
    return _then(_value.copyWith(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String userID, List<UserInterests>? interests});
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
    Object? interests = freezed,
  }) {
    return _then(_$_UserAccountModel(
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
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
      {required this.userID, final List<UserInterests>? interests})
      : _interests = interests;

  factory _$_UserAccountModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserAccountModelFromJson(json);

  @override
  final String userID;
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
    return 'UserAccountModel(userID: $userID, interests: $interests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAccountModel &&
            const DeepCollectionEquality().equals(other.userID, userID) &&
            const DeepCollectionEquality()
                .equals(other._interests, _interests));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userID),
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
      final List<UserInterests>? interests}) = _$_UserAccountModel;

  factory _UserAccountModel.fromJson(Map<String, dynamic> json) =
      _$_UserAccountModel.fromJson;

  @override
  String get userID;
  @override
  List<UserInterests>? get interests;
  @override
  @JsonKey(ignore: true)
  _$$_UserAccountModelCopyWith<_$_UserAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}
