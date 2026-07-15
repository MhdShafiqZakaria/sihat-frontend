// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_number_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueueNumberDto _$QueueNumberDtoFromJson(Map<String, dynamic> json) =>
    QueueNumberDto(
      userQueueNumber: json['userQueueNumber'] as String?,
      currentlyAttendingNumber: json['currentlyAttendingNumber'] as String?,
      session: json['session'] as String,
    );

Map<String, dynamic> _$QueueNumberDtoToJson(QueueNumberDto instance) =>
    <String, dynamic>{
      'userQueueNumber': instance.userQueueNumber,
      'currentlyAttendingNumber': instance.currentlyAttendingNumber,
      'session': instance.session,
    };

const _$QueueNumberDtoJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'userQueueNumber': {'type': 'string'},
    'currentlyAttendingNumber': {'type': 'string'},
    'session': {'type': 'string'},
  },
  'required': ['session'],
};
