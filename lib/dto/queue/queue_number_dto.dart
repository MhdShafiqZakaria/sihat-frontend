import 'package:json_annotation/json_annotation.dart';

part 'queue_number_dto.g.dart';

@JsonSerializable(createJsonSchema: true)
class QueueNumberDto {
  final String? userQueueNumber;
  final String? currentlyAttendingNumber;
  final String session;

  const QueueNumberDto({
    this.userQueueNumber,
    this.currentlyAttendingNumber,
    required this.session,
  });

  //Used json serializable for json handling
  factory QueueNumberDto.fromJson(Map<String, dynamic> json) => _$QueueNumberDtoFromJson(json);

  Map<String,dynamic> toJson() => _$QueueNumberDtoToJson(this);

  static const jsonSchema = _$QueueNumberDtoJsonSchema;
}
