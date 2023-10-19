import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

enum ImportantType {
  none,
  low,
  meddium,
  hight;
}

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    @Default('') String content,
    @Default(ImportantType.none) ImportantType type,
    @Default(false) bool isSelect,
    @Default(false) bool isDeleted,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}
