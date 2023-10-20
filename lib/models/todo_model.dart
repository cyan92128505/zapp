import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

enum ImportantType {
  none,
  low,
  meddium,
  hight;

  String get name => switch (this) {
        ImportantType.none => 'None',
        ImportantType.low => 'Low',
        ImportantType.meddium => 'Meddium',
        ImportantType.hight => 'Hight',
      };

  static getType(String raw) {
    return switch (raw) {
      'None' => ImportantType.none,
      'Low' => ImportantType.low,
      'Meddium' => ImportantType.meddium,
      'Hight' => ImportantType.hight,
      String() => ImportantType.none,
    };
  }
}

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    @Default('') String id,
    @Default('') String content,
    @Default('None') String type,
    @Default(false) bool completed,
    @Default(false) bool deleted,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}
