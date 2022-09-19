// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'business_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BusinessAccountModel _$BusinessAccountModelFromJson(
  Map<String, dynamic> json,
) {
  return _BusinessAccountModel.fromJson(
    json,
  );
}

/// @nodoc
mixin _$BusinessAccountModel {
  BusinessTypes get type => throw _privateConstructorUsedError;
  List<BusinessDayAvailabilityModel> get availability =>
      throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  BusinessLocationModel get location => throw _privateConstructorUsedError;
  String get moreInfo => throw _privateConstructorUsedError;
  List<String> get imageurls => throw _privateConstructorUsedError;
  List<String> get vidoeurls => throw _privateConstructorUsedError;
  String get businessID => throw _privateConstructorUsedError;
  BusinessEcommerceModel? get store => throw _privateConstructorUsedError;
  List<SportsFacilityModel>? get sportsFacilities =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusinessAccountModelCopyWith<BusinessAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessAccountModelCopyWith<$Res> {
  factory $BusinessAccountModelCopyWith(BusinessAccountModel value,
          $Res Function(BusinessAccountModel) then) =
      _$BusinessAccountModelCopyWithImpl<$Res>;
  $Res call(
      {BusinessTypes type,
      List<BusinessDayAvailabilityModel> availability,
      String name,
      String description,
      BusinessLocationModel location,
      String moreInfo,
      List<String> imageurls,
      List<String> vidoeurls,
      String businessID,
      BusinessEcommerceModel? store,
      List<SportsFacilityModel>? sportsFacilities});

  $BusinessLocationModelCopyWith<$Res> get location;
  $BusinessEcommerceModelCopyWith<$Res>? get store;
}

/// @nodoc
class _$BusinessAccountModelCopyWithImpl<$Res>
    implements $BusinessAccountModelCopyWith<$Res> {
  _$BusinessAccountModelCopyWithImpl(this._value, this._then);

  final BusinessAccountModel _value;
  // ignore: unused_field
  final $Res Function(BusinessAccountModel) _then;

  @override
  $Res call({
    Object? type = freezed,
    Object? availability = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? location = freezed,
    Object? moreInfo = freezed,
    Object? imageurls = freezed,
    Object? vidoeurls = freezed,
    Object? businessID = freezed,
    Object? store = freezed,
    Object? sportsFacilities = freezed,
  }) {
    return _then(_value.copyWith(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BusinessTypes,
      availability: availability == freezed
          ? _value.availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<BusinessDayAvailabilityModel>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as BusinessLocationModel,
      moreInfo: moreInfo == freezed
          ? _value.moreInfo
          : moreInfo // ignore: cast_nullable_to_non_nullable
              as String,
      imageurls: imageurls == freezed
          ? _value.imageurls
          : imageurls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vidoeurls: vidoeurls == freezed
          ? _value.vidoeurls
          : vidoeurls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      businessID: businessID == freezed
          ? _value.businessID
          : businessID // ignore: cast_nullable_to_non_nullable
              as String,
      store: store == freezed
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as BusinessEcommerceModel?,
      sportsFacilities: sportsFacilities == freezed
          ? _value.sportsFacilities
          : sportsFacilities // ignore: cast_nullable_to_non_nullable
              as List<SportsFacilityModel>?,
    ));
  }

  @override
  $BusinessLocationModelCopyWith<$Res> get location {
    return $BusinessLocationModelCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value));
    });
  }

  @override
  $BusinessEcommerceModelCopyWith<$Res>? get store {
    if (_value.store == null) {
      return null;
    }

    return $BusinessEcommerceModelCopyWith<$Res>(_value.store!, (value) {
      return _then(_value.copyWith(store: value));
    });
  }
}

/// @nodoc
abstract class _$$_BusinessAccountModelCopyWith<$Res>
    implements $BusinessAccountModelCopyWith<$Res> {
  factory _$$_BusinessAccountModelCopyWith(_$_BusinessAccountModel value,
          $Res Function(_$_BusinessAccountModel) then) =
      __$$_BusinessAccountModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {BusinessTypes type,
      List<BusinessDayAvailabilityModel> availability,
      String name,
      String description,
      BusinessLocationModel location,
      String moreInfo,
      List<String> imageurls,
      List<String> vidoeurls,
      String businessID,
      BusinessEcommerceModel? store,
      List<SportsFacilityModel>? sportsFacilities});

  @override
  $BusinessLocationModelCopyWith<$Res> get location;
  @override
  $BusinessEcommerceModelCopyWith<$Res>? get store;
}

/// @nodoc
class __$$_BusinessAccountModelCopyWithImpl<$Res>
    extends _$BusinessAccountModelCopyWithImpl<$Res>
    implements _$$_BusinessAccountModelCopyWith<$Res> {
  __$$_BusinessAccountModelCopyWithImpl(_$_BusinessAccountModel _value,
      $Res Function(_$_BusinessAccountModel) _then)
      : super(_value, (v) => _then(v as _$_BusinessAccountModel));

  @override
  _$_BusinessAccountModel get _value => super._value as _$_BusinessAccountModel;

  @override
  $Res call({
    Object? type = freezed,
    Object? availability = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? location = freezed,
    Object? moreInfo = freezed,
    Object? imageurls = freezed,
    Object? vidoeurls = freezed,
    Object? businessID = freezed,
    Object? store = freezed,
    Object? sportsFacilities = freezed,
  }) {
    return _then(_$_BusinessAccountModel(
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BusinessTypes,
      availability: availability == freezed
          ? _value._availability
          : availability // ignore: cast_nullable_to_non_nullable
              as List<BusinessDayAvailabilityModel>,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as BusinessLocationModel,
      moreInfo: moreInfo == freezed
          ? _value.moreInfo
          : moreInfo // ignore: cast_nullable_to_non_nullable
              as String,
      imageurls: imageurls == freezed
          ? _value._imageurls
          : imageurls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      vidoeurls: vidoeurls == freezed
          ? _value._vidoeurls
          : vidoeurls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      businessID: businessID == freezed
          ? _value.businessID
          : businessID // ignore: cast_nullable_to_non_nullable
              as String,
      store: store == freezed
          ? _value.store
          : store // ignore: cast_nullable_to_non_nullable
              as BusinessEcommerceModel?,
      sportsFacilities: sportsFacilities == freezed
          ? _value._sportsFacilities
          : sportsFacilities // ignore: cast_nullable_to_non_nullable
              as List<SportsFacilityModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BusinessAccountModel implements _BusinessAccountModel {
  const _$_BusinessAccountModel(
      {required this.type,
      required final List<BusinessDayAvailabilityModel> availability,
      required this.name,
      required this.description,
      required this.location,
      required this.moreInfo,
      required final List<String> imageurls,
      required final List<String> vidoeurls,
      required this.businessID,
      this.store,
      final List<SportsFacilityModel>? sportsFacilities})
      : _availability = availability,
        _imageurls = imageurls,
        _vidoeurls = vidoeurls,
        _sportsFacilities = sportsFacilities;

  factory _$_BusinessAccountModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$$_BusinessAccountModelFromJson(
        json,
      );

  @override
  final BusinessTypes type;
  final List<BusinessDayAvailabilityModel> _availability;
  @override
  List<BusinessDayAvailabilityModel> get availability {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availability);
  }

  @override
  final String name;
  @override
  final String description;
  @override
  final BusinessLocationModel location;
  @override
  final String moreInfo;
  final List<String> _imageurls;
  @override
  List<String> get imageurls {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageurls);
  }

  final List<String> _vidoeurls;
  @override
  List<String> get vidoeurls {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vidoeurls);
  }

  @override
  final String businessID;
  @override
  final BusinessEcommerceModel? store;
  final List<SportsFacilityModel>? _sportsFacilities;
  @override
  List<SportsFacilityModel>? get sportsFacilities {
    final value = _sportsFacilities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'BusinessAccountModel(type: $type, availability: $availability, name: $name, description: $description, location: $location, moreInfo: $moreInfo, imageurls: $imageurls, vidoeurls: $vidoeurls, businessID: $businessID, store: $store, sportsFacilities: $sportsFacilities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BusinessAccountModel &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality()
                .equals(other._availability, _availability) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.moreInfo, moreInfo) &&
            const DeepCollectionEquality()
                .equals(other._imageurls, _imageurls) &&
            const DeepCollectionEquality()
                .equals(other._vidoeurls, _vidoeurls) &&
            const DeepCollectionEquality()
                .equals(other.businessID, businessID) &&
            const DeepCollectionEquality().equals(other.store, store) &&
            const DeepCollectionEquality()
                .equals(other._sportsFacilities, _sportsFacilities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(_availability),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(moreInfo),
      const DeepCollectionEquality().hash(_imageurls),
      const DeepCollectionEquality().hash(_vidoeurls),
      const DeepCollectionEquality().hash(businessID),
      const DeepCollectionEquality().hash(store),
      const DeepCollectionEquality().hash(_sportsFacilities));

  @JsonKey(ignore: true)
  @override
  _$$_BusinessAccountModelCopyWith<_$_BusinessAccountModel> get copyWith =>
      __$$_BusinessAccountModelCopyWithImpl<_$_BusinessAccountModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BusinessAccountModelToJson(
      this,
    );
  }
}

abstract class _BusinessAccountModel implements BusinessAccountModel {
  const factory _BusinessAccountModel(
          {required final BusinessTypes type,
          required final List<BusinessDayAvailabilityModel> availability,
          required final String name,
          required final String description,
          required final BusinessLocationModel location,
          required final String moreInfo,
          required final List<String> imageurls,
          required final List<String> vidoeurls,
          required final String businessID,
          final BusinessEcommerceModel? store,
          final List<SportsFacilityModel>? sportsFacilities}) =
      _$_BusinessAccountModel;

  factory _BusinessAccountModel.fromJson(
    Map<String, dynamic> json,
  ) = _$_BusinessAccountModel.fromJson;

  @override
  BusinessTypes get type;
  @override
  List<BusinessDayAvailabilityModel> get availability;
  @override
  String get name;
  @override
  String get description;
  @override
  BusinessLocationModel get location;
  @override
  String get moreInfo;
  @override
  List<String> get imageurls;
  @override
  List<String> get vidoeurls;
  @override
  String get businessID;
  @override
  BusinessEcommerceModel? get store;
  @override
  List<SportsFacilityModel>? get sportsFacilities;
  @override
  @JsonKey(ignore: true)
  _$$_BusinessAccountModelCopyWith<_$_BusinessAccountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

BusinessDayAvailabilityModel _$BusinessDayAvailabilityModelFromJson(
  Map<String, dynamic> json,
) {
  return _BusinessDayAvailabilityModel.fromJson(
    json,
  );
}

/// @nodoc
mixin _$BusinessDayAvailabilityModel {
  DaysOfWeek get day => throw _privateConstructorUsedError;
  List<RangedTime> get times => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusinessDayAvailabilityModelCopyWith<BusinessDayAvailabilityModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessDayAvailabilityModelCopyWith<$Res> {
  factory $BusinessDayAvailabilityModelCopyWith(
          BusinessDayAvailabilityModel value,
          $Res Function(BusinessDayAvailabilityModel) then) =
      _$BusinessDayAvailabilityModelCopyWithImpl<$Res>;
  $Res call({DaysOfWeek day, List<RangedTime> times});
}

/// @nodoc
class _$BusinessDayAvailabilityModelCopyWithImpl<$Res>
    implements $BusinessDayAvailabilityModelCopyWith<$Res> {
  _$BusinessDayAvailabilityModelCopyWithImpl(this._value, this._then);

  final BusinessDayAvailabilityModel _value;
  // ignore: unused_field
  final $Res Function(BusinessDayAvailabilityModel) _then;

  @override
  $Res call({
    Object? day = freezed,
    Object? times = freezed,
  }) {
    return _then(_value.copyWith(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DaysOfWeek,
      times: times == freezed
          ? _value.times
          : times // ignore: cast_nullable_to_non_nullable
              as List<RangedTime>,
    ));
  }
}

/// @nodoc
abstract class _$$_BusinessDayAvailabilityModelCopyWith<$Res>
    implements $BusinessDayAvailabilityModelCopyWith<$Res> {
  factory _$$_BusinessDayAvailabilityModelCopyWith(
          _$_BusinessDayAvailabilityModel value,
          $Res Function(_$_BusinessDayAvailabilityModel) then) =
      __$$_BusinessDayAvailabilityModelCopyWithImpl<$Res>;
  @override
  $Res call({DaysOfWeek day, List<RangedTime> times});
}

/// @nodoc
class __$$_BusinessDayAvailabilityModelCopyWithImpl<$Res>
    extends _$BusinessDayAvailabilityModelCopyWithImpl<$Res>
    implements _$$_BusinessDayAvailabilityModelCopyWith<$Res> {
  __$$_BusinessDayAvailabilityModelCopyWithImpl(
      _$_BusinessDayAvailabilityModel _value,
      $Res Function(_$_BusinessDayAvailabilityModel) _then)
      : super(_value, (v) => _then(v as _$_BusinessDayAvailabilityModel));

  @override
  _$_BusinessDayAvailabilityModel get _value =>
      super._value as _$_BusinessDayAvailabilityModel;

  @override
  $Res call({
    Object? day = freezed,
    Object? times = freezed,
  }) {
    return _then(_$_BusinessDayAvailabilityModel(
      day: day == freezed
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DaysOfWeek,
      times: times == freezed
          ? _value._times
          : times // ignore: cast_nullable_to_non_nullable
              as List<RangedTime>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BusinessDayAvailabilityModel implements _BusinessDayAvailabilityModel {
  const _$_BusinessDayAvailabilityModel(
      {required this.day, required final List<RangedTime> times})
      : _times = times;

  factory _$_BusinessDayAvailabilityModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$$_BusinessDayAvailabilityModelFromJson(
        json,
      );

  @override
  final DaysOfWeek day;
  final List<RangedTime> _times;
  @override
  List<RangedTime> get times {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_times);
  }

  @override
  String toString() {
    return 'BusinessDayAvailabilityModel(day: $day, times: $times)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BusinessDayAvailabilityModel &&
            const DeepCollectionEquality().equals(other.day, day) &&
            const DeepCollectionEquality().equals(other._times, _times));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(day),
      const DeepCollectionEquality().hash(_times));

  @JsonKey(ignore: true)
  @override
  _$$_BusinessDayAvailabilityModelCopyWith<_$_BusinessDayAvailabilityModel>
      get copyWith => __$$_BusinessDayAvailabilityModelCopyWithImpl<
          _$_BusinessDayAvailabilityModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BusinessDayAvailabilityModelToJson(
      this,
    );
  }
}

abstract class _BusinessDayAvailabilityModel
    implements BusinessDayAvailabilityModel {
  const factory _BusinessDayAvailabilityModel(
      {required final DaysOfWeek day,
      required final List<RangedTime> times}) = _$_BusinessDayAvailabilityModel;

  factory _BusinessDayAvailabilityModel.fromJson(
    Map<String, dynamic> json,
  ) = _$_BusinessDayAvailabilityModel.fromJson;

  @override
  DaysOfWeek get day;
  @override
  List<RangedTime> get times;
  @override
  @JsonKey(ignore: true)
  _$$_BusinessDayAvailabilityModelCopyWith<_$_BusinessDayAvailabilityModel>
      get copyWith => throw _privateConstructorUsedError;
}

BusinessLocationModel _$BusinessLocationModelFromJson(
    Map<String, dynamic> json) {
  return _BusinessLocationModel.fromJson(json);
}

/// @nodoc
mixin _$BusinessLocationModel {
  double get longitude => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BusinessLocationModelCopyWith<BusinessLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessLocationModelCopyWith<$Res> {
  factory $BusinessLocationModelCopyWith(BusinessLocationModel value,
          $Res Function(BusinessLocationModel) then) =
      _$BusinessLocationModelCopyWithImpl<$Res>;
  $Res call({double longitude, double latitude, String location});
}

/// @nodoc
class _$BusinessLocationModelCopyWithImpl<$Res>
    implements $BusinessLocationModelCopyWith<$Res> {
  _$BusinessLocationModelCopyWithImpl(this._value, this._then);

  final BusinessLocationModel _value;
  // ignore: unused_field
  final $Res Function(BusinessLocationModel) _then;

  @override
  $Res call({
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_BusinessLocationModelCopyWith<$Res>
    implements $BusinessLocationModelCopyWith<$Res> {
  factory _$$_BusinessLocationModelCopyWith(_$_BusinessLocationModel value,
          $Res Function(_$_BusinessLocationModel) then) =
      __$$_BusinessLocationModelCopyWithImpl<$Res>;
  @override
  $Res call({double longitude, double latitude, String location});
}

/// @nodoc
class __$$_BusinessLocationModelCopyWithImpl<$Res>
    extends _$BusinessLocationModelCopyWithImpl<$Res>
    implements _$$_BusinessLocationModelCopyWith<$Res> {
  __$$_BusinessLocationModelCopyWithImpl(_$_BusinessLocationModel _value,
      $Res Function(_$_BusinessLocationModel) _then)
      : super(_value, (v) => _then(v as _$_BusinessLocationModel));

  @override
  _$_BusinessLocationModel get _value =>
      super._value as _$_BusinessLocationModel;

  @override
  $Res call({
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_BusinessLocationModel(
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BusinessLocationModel implements _BusinessLocationModel {
  const _$_BusinessLocationModel(
      {required this.longitude,
      required this.latitude,
      required this.location});

  factory _$_BusinessLocationModel.fromJson(Map<String, dynamic> json) =>
      _$$_BusinessLocationModelFromJson(json);

  @override
  final double longitude;
  @override
  final double latitude;
  @override
  final String location;

  @override
  String toString() {
    return 'BusinessLocationModel(longitude: $longitude, latitude: $latitude, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BusinessLocationModel &&
            const DeepCollectionEquality().equals(other.longitude, longitude) &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.location, location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(longitude),
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(location));

  @JsonKey(ignore: true)
  @override
  _$$_BusinessLocationModelCopyWith<_$_BusinessLocationModel> get copyWith =>
      __$$_BusinessLocationModelCopyWithImpl<_$_BusinessLocationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BusinessLocationModelToJson(
      this,
    );
  }
}

abstract class _BusinessLocationModel implements BusinessLocationModel {
  const factory _BusinessLocationModel(
      {required final double longitude,
      required final double latitude,
      required final String location}) = _$_BusinessLocationModel;

  factory _BusinessLocationModel.fromJson(Map<String, dynamic> json) =
      _$_BusinessLocationModel.fromJson;

  @override
  double get longitude;
  @override
  double get latitude;
  @override
  String get location;
  @override
  @JsonKey(ignore: true)
  _$$_BusinessLocationModelCopyWith<_$_BusinessLocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

RangedTime _$RangedTimeFromJson(Map<String, dynamic> json) {
  return _RangedTime.fromJson(json);
}

/// @nodoc
mixin _$RangedTime {
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RangedTimeCopyWith<RangedTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RangedTimeCopyWith<$Res> {
  factory $RangedTimeCopyWith(
          RangedTime value, $Res Function(RangedTime) then) =
      _$RangedTimeCopyWithImpl<$Res>;
  $Res call({DateTime startTime, DateTime endTime});
}

/// @nodoc
class _$RangedTimeCopyWithImpl<$Res> implements $RangedTimeCopyWith<$Res> {
  _$RangedTimeCopyWithImpl(this._value, this._then);

  final RangedTime _value;
  // ignore: unused_field
  final $Res Function(RangedTime) _then;

  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$$_RangedTimeCopyWith<$Res>
    implements $RangedTimeCopyWith<$Res> {
  factory _$$_RangedTimeCopyWith(
          _$_RangedTime value, $Res Function(_$_RangedTime) then) =
      __$$_RangedTimeCopyWithImpl<$Res>;
  @override
  $Res call({DateTime startTime, DateTime endTime});
}

/// @nodoc
class __$$_RangedTimeCopyWithImpl<$Res> extends _$RangedTimeCopyWithImpl<$Res>
    implements _$$_RangedTimeCopyWith<$Res> {
  __$$_RangedTimeCopyWithImpl(
      _$_RangedTime _value, $Res Function(_$_RangedTime) _then)
      : super(_value, (v) => _then(v as _$_RangedTime));

  @override
  _$_RangedTime get _value => super._value as _$_RangedTime;

  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$_RangedTime(
      startTime: startTime == freezed
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: endTime == freezed
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RangedTime implements _RangedTime {
  const _$_RangedTime({required this.startTime, required this.endTime});

  factory _$_RangedTime.fromJson(Map<String, dynamic> json) =>
      _$$_RangedTimeFromJson(json);

  @override
  final DateTime startTime;
  @override
  final DateTime endTime;

  @override
  String toString() {
    return 'RangedTime(startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RangedTime &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(endTime));

  @JsonKey(ignore: true)
  @override
  _$$_RangedTimeCopyWith<_$_RangedTime> get copyWith =>
      __$$_RangedTimeCopyWithImpl<_$_RangedTime>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RangedTimeToJson(
      this,
    );
  }
}

abstract class _RangedTime implements RangedTime {
  const factory _RangedTime(
      {required final DateTime startTime,
      required final DateTime endTime}) = _$_RangedTime;

  factory _RangedTime.fromJson(Map<String, dynamic> json) =
      _$_RangedTime.fromJson;

  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  @JsonKey(ignore: true)
  _$$_RangedTimeCopyWith<_$_RangedTime> get copyWith =>
      throw _privateConstructorUsedError;
}
