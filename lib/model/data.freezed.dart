// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MiniMartDataTearOff {
  const _$MiniMartDataTearOff();

  _MiniMartData call(
      {String? title,
      String? color,
      int? price,
      String? img,
      String? des,
      int? count}) {
    return _MiniMartData(
      title: title,
      color: color,
      price: price,
      img: img,
      des: des,
      count: count,
    );
  }
}

/// @nodoc
const $MiniMartData = _$MiniMartDataTearOff();

/// @nodoc
mixin _$MiniMartData {
  String? get title => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  String? get img => throw _privateConstructorUsedError;
  String? get des => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MiniMartDataCopyWith<MiniMartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MiniMartDataCopyWith<$Res> {
  factory $MiniMartDataCopyWith(
          MiniMartData value, $Res Function(MiniMartData) then) =
      _$MiniMartDataCopyWithImpl<$Res>;
  $Res call(
      {String? title,
      String? color,
      int? price,
      String? img,
      String? des,
      int? count});
}

/// @nodoc
class _$MiniMartDataCopyWithImpl<$Res> implements $MiniMartDataCopyWith<$Res> {
  _$MiniMartDataCopyWithImpl(this._value, this._then);

  final MiniMartData _value;
  // ignore: unused_field
  final $Res Function(MiniMartData) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? color = freezed,
    Object? price = freezed,
    Object? img = freezed,
    Object? des = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      img: img == freezed
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      des: des == freezed
          ? _value.des
          : des // ignore: cast_nullable_to_non_nullable
              as String?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$MiniMartDataCopyWith<$Res>
    implements $MiniMartDataCopyWith<$Res> {
  factory _$MiniMartDataCopyWith(
          _MiniMartData value, $Res Function(_MiniMartData) then) =
      __$MiniMartDataCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? title,
      String? color,
      int? price,
      String? img,
      String? des,
      int? count});
}

/// @nodoc
class __$MiniMartDataCopyWithImpl<$Res> extends _$MiniMartDataCopyWithImpl<$Res>
    implements _$MiniMartDataCopyWith<$Res> {
  __$MiniMartDataCopyWithImpl(
      _MiniMartData _value, $Res Function(_MiniMartData) _then)
      : super(_value, (v) => _then(v as _MiniMartData));

  @override
  _MiniMartData get _value => super._value as _MiniMartData;

  @override
  $Res call({
    Object? title = freezed,
    Object? color = freezed,
    Object? price = freezed,
    Object? img = freezed,
    Object? des = freezed,
    Object? count = freezed,
  }) {
    return _then(_MiniMartData(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      img: img == freezed
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String?,
      des: des == freezed
          ? _value.des
          : des // ignore: cast_nullable_to_non_nullable
              as String?,
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_MiniMartData implements _MiniMartData {
  _$_MiniMartData(
      {this.title, this.color, this.price, this.img, this.des, this.count});

  @override
  final String? title;
  @override
  final String? color;
  @override
  final int? price;
  @override
  final String? img;
  @override
  final String? des;
  @override
  final int? count;

  @override
  String toString() {
    return 'MiniMartData(title: $title, color: $color, price: $price, img: $img, des: $des, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MiniMartData &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.img, img) &&
            const DeepCollectionEquality().equals(other.des, des) &&
            const DeepCollectionEquality().equals(other.count, count));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(img),
      const DeepCollectionEquality().hash(des),
      const DeepCollectionEquality().hash(count));

  @JsonKey(ignore: true)
  @override
  _$MiniMartDataCopyWith<_MiniMartData> get copyWith =>
      __$MiniMartDataCopyWithImpl<_MiniMartData>(this, _$identity);
}

abstract class _MiniMartData implements MiniMartData {
  factory _MiniMartData(
      {String? title,
      String? color,
      int? price,
      String? img,
      String? des,
      int? count}) = _$_MiniMartData;

  @override
  String? get title;
  @override
  String? get color;
  @override
  int? get price;
  @override
  String? get img;
  @override
  String? get des;
  @override
  int? get count;
  @override
  @JsonKey(ignore: true)
  _$MiniMartDataCopyWith<_MiniMartData> get copyWith =>
      throw _privateConstructorUsedError;
}
