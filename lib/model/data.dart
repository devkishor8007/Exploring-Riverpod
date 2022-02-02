import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';

@freezed
class MiniMartData with _$MiniMartData {
  factory MiniMartData({
    String? title,
    String? color,
    int? price,
    String? img,
    String ?des,
    int? count,
  }) = _MiniMartData;
}
