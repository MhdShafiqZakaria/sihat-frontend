import 'package:json_annotation/json_annotation.dart';
part 'gl_details_dto.g.dart';

@JsonSerializable(createJsonSchema: true)
class GlDetailsDto {
  final int glId;
  final String hospitalName;
  final String statusCode;
  final DateTime submittedDate;
  final DateTime statusDate;
  final DateTime pickupDate;

  const GlDetailsDto({
    required this.glId,
    required this.hospitalName,
    required this.statusCode,
    required this.submittedDate,
    required this.statusDate,
    required this.pickupDate,
  });

  //Used json serializable for json handling
  factory GlDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$GlDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GlDetailsDtoToJson(this);

  static const jsonSchema = _$GlDetailsDtoJsonSchema;
}
