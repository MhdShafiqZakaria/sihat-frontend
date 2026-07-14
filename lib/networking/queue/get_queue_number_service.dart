import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_test_sihat/dto/queue/queue_number_dto.dart';

class GetQueueNumberService {
  final String baseUrl;
  final String Function() getCredentials;

  GetQueueNumberService({required this.baseUrl,required this.getCredentials});

  Future<QueueNumberDto> getUserQueueTicket() async {
    final encoded = base64Encode(utf8.encode(getCredentials()));

    final response = await http
        .get(
          Uri.parse('$baseUrl/api/v1/patient/queue/'),
          headers: {
            'Authorization': 'Basic $encoded',
            'Content-Type': 'application/json',
          },
        )
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      print('API Response: ${response.body}');
      final decoded = jsonDecode(response.body);
      if(decoded is List && decoded.isEmpty){
        return QueueNumberDto(
          userQueueNumber: null,
          currentlyAttendingNumber: null,
          session: "NO_DATA",
        );
      }
      if(decoded is List){
      return QueueNumberDto.fromJson(decoded[0]);
    }
      return QueueNumberDto.fromJson(decoded);}

    if (response.statusCode == 401) {
      throw Exception('Unauthorized');
    }

    throw Exception('Failed to fetch queue ticket: ${response.statusCode}');
  }
}
