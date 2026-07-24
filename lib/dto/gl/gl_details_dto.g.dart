// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gl_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlDetailsDto _$GlDetailsDtoFromJson(Map<String, dynamic> json) => GlDetailsDto(
  glId: (json['glId'] as num).toInt(),
  hospitalName: json['hospitalName'] as String,
  statusCode: json['statusCode'] as String,
  submittedDate: DateTime.parse(json['submittedDate'] as String),
  statusDate: DateTime.parse(json['statusDate'] as String),
  pickupDate: DateTime.parse(json['pickupDate'] as String),
);

Map<String, dynamic> _$GlDetailsDtoToJson(GlDetailsDto instance) =>
    <String, dynamic>{
      'glId': instance.glId,
      'hospitalName': instance.hospitalName,
      'statusCode': instance.statusCode,
      'submittedDate': instance.submittedDate.toIso8601String(),
      'statusDate': instance.statusDate.toIso8601String(),
      'pickupDate': instance.pickupDate.toIso8601String(),
    };

const _$GlDetailsDtoJsonSchema = {
  r'$schema': 'https://json-schema.org/draft/2020-12/schema',
  'type': 'object',
  'properties': {
    'glId': {'type': 'integer'},
    'hospitalName': {'type': 'string'},
    'statusCode': {'type': 'string'},
    'submittedDate': {'type': 'string', 'format': 'date-time'},
    'statusDate': {'type': 'string', 'format': 'date-time'},
    'pickupDate': {'type': 'string', 'format': 'date-time'},
  },
  'required': [
    'glId',
    'hospitalName',
    'statusCode',
    'submittedDate',
    'statusDate',
    'pickupDate',
  ],
};
