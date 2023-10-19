// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoModelImpl _$$TodoModelImplFromJson(Map<String, dynamic> json) =>
    _$TodoModelImpl(
      content: json['content'] as String? ?? '',
      type: $enumDecodeNullable(_$ImportantTypeEnumMap, json['type']) ??
          ImportantType.none,
      isSelect: json['isSelect'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$TodoModelImplToJson(_$TodoModelImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'type': _$ImportantTypeEnumMap[instance.type]!,
      'isSelect': instance.isSelect,
      'isDeleted': instance.isDeleted,
    };

const _$ImportantTypeEnumMap = {
  ImportantType.none: 'none',
  ImportantType.low: 'low',
  ImportantType.meddium: 'meddium',
  ImportantType.hight: 'hight',
};
