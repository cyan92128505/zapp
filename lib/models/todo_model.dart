import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';

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
    @Default('') String content,
    @Default(ImportantType.none) ImportantType type,
    @Default(false) bool isDone,
    @Default(false) bool isDeleted,
  }) = _TodoModel;
}
