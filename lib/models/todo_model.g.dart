// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoModelImpl _$$TodoModelImplFromJson(Map<String, dynamic> json) =>
    _$TodoModelImpl(
      id: json['id'] as String? ?? '',
      content: json['content'] as String? ?? '',
      type: json['type'] as String? ?? 'None',
      completed: json['completed'] as bool? ?? false,
      deleted: json['deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$TodoModelImplToJson(_$TodoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'type': instance.type,
      'completed': instance.completed,
      'deleted': instance.deleted,
    };
