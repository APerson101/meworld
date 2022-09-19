// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sporting_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SportsEventModel _$SportsEventModelFromJson(Map<String, dynamic> json) {
  return _SportsEventModel.fromJson(json);
}

/// @nodoc
mixin _$SportsEventModel {
  String get name => throw _privateConstructorUsedError;
  String get creatorID => throw _privateConstructorUsedError;
  String get eventID => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  SportingEventTypes get eventType => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SportsEventModelCopyWith<SportsEventModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SportsEventModelCopyWith<$Res> {
  factory $SportsEventModelCopyWith(
          SportsEventModel value, $Res Function(SportsEventModel) then) =
      _$SportsEventModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String creatorID,
      String eventID,
      String location,
      SportingEventTypes eventType,
      String description,
      DateTime startTime,
      DateTime endTime});
}

/// @nodoc
class _$SportsEventModelCopyWithImpl<$Res>
    implements $SportsEventModelCopyWith<$Res> {
  _$SportsEventModelCopyWithImpl(this._value, this._then);

  final SportsEventModel _value;
  // ignore: unused_field
  final $Res Function(SportsEventModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? creatorID = freezed,
    Object? eventID = freezed,
    Object? location = freezed,
    Object? eventType = freezed,
    Object? description = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      creatorID: creatorID == freezed
          ? _value.creatorID
          : creatorID // ignore: cast_nullable_to_non_nullable
              as String,
      eventID: eventID == freezed
          ? _value.eventID
          : eventID // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: eventType == freezed
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as SportingEventTypes,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_SportsEventModelCopyWith<$Res>
    implements $SportsEventModelCopyWith<$Res> {
  factory _$$_SportsEventModelCopyWith(
          _$_SportsEventModel value, $Res Function(_$_SportsEventModel) then) =
      __$$_SportsEventModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String creatorID,
      String eventID,
      String location,
      SportingEventTypes eventType,
      String description,
      DateTime startTime,
      DateTime endTime});
}

/// @nodoc
class __$$_SportsEventModelCopyWithImpl<$Res>
    extends _$SportsEventModelCopyWithImpl<$Res>
    implements _$$_SportsEventModelCopyWith<$Res> {
  __$$_SportsEventModelCopyWithImpl(
      _$_SportsEventModel _value, $Res Function(_$_SportsEventModel) _then)
      : super(_value, (v) => _then(v as _$_SportsEventModel));

  @override
  _$_SportsEventModel get _value => super._value as _$_SportsEventModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? creatorID = freezed,
    Object? eventID = freezed,
    Object? location = freezed,
    Object? eventType = freezed,
    Object? description = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$_SportsEventModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      creatorID: creatorID == freezed
          ? _value.creatorID
          : creatorID // ignore: cast_nullable_to_non_nullable
              as String,
      eventID: eventID == freezed
          ? _value.eventID
          : eventID // ignore: cast_nullable_to_non_nullable
              as String,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: eventType == freezed
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as SportingEventTypes,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_SportsEventModel implements _SportsEventModel {
  const _$_SportsEventModel(
      {required this.name,
      required this.creatorID,
      required this.eventID,
      required this.location,
      required this.eventType,
      required this.description,
      required this.startTime,
      required this.endTime});

  factory _$_SportsEventModel.fromJson(Map<String, dynamic> json) =>
      _$$_SportsEventModelFromJson(json);

  @override
  final String name;
  @override
  final String creatorID;
  @override
  final String eventID;
  @override
  final String location;
  @override
  final SportingEventTypes eventType;
  @override
  final String description;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;

  @override
  String toString() {
    return 'SportsEventModel(name: $name, creatorID: $creatorID, eventID: $eventID, location: $location, eventType: $eventType, description: $description, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SportsEventModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.creatorID, creatorID) &&
            const DeepCollectionEquality().equals(other.eventID, eventID) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.eventType, eventType) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(creatorID),
      const DeepCollectionEquality().hash(eventID),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(eventType),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(startTime),
      const DeepCollectionEquality().hash(endTime));

  @JsonKey(ignore: true)
  @override
  _$$_SportsEventModelCopyWith<_$_SportsEventModel> get copyWith =>
      __$$_SportsEventModelCopyWithImpl<_$_SportsEventModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SportsEventModelToJson(
      this,
    );
  }
}

abstract class _SportsEventModel implements SportsEventModel {
  const factory _SportsEventModel(
      {required final String name,
      required final String creatorID,
      required final String eventID,
      required final String location,
      required final SportingEventTypes eventType,
      required final String description,
      required final DateTime startTime,
      required final DateTime endTime}) = _$_SportsEventModel;

  factory _SportsEventModel.fromJson(Map<String, dynamic> json) =
      _$_SportsEventModel.fromJson;

  @override
  String get name;
  @override
  String get creatorID;
  @override
  String get eventID;
  @override
  String get location;
  @override
  SportingEventTypes get eventType;
  @override
  String get description;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  @JsonKey(ignore: true)
  _$$_SportsEventModelCopyWith<_$_SportsEventModel> get copyWith =>
      throw _privateConstructorUsedError;
}
