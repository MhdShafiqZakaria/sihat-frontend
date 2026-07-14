class QueueNumberDto {
  final String? userQueueNumber;
  final String? currentlyAttendingNumber;
  final String session;

  const QueueNumberDto({
    this.userQueueNumber,
    this.currentlyAttendingNumber,
    required this.session,
  });

  factory QueueNumberDto.fromJson(Map<String, dynamic> json) {
    return QueueNumberDto(
      userQueueNumber: json['userQueueNumber'],
      currentlyAttendingNumber: json['currentlyAttendingNumber'],
      session: json['session'],
    );
  }
}
