import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test_sihat/dto/queue/queue_number_dto.dart';
import 'package:flutter_test_sihat/networking/queue/get_queue_number_service.dart';

import '../../utils/exceptions.dart';

class QueueFeeder {
  final GetQueueNumberService getQueueNumberService;

  QueueFeeder({required this.getQueueNumberService});

  Future<QueueNumberDto> fetchUserQueueTicket() async {
    try {
      final response = await getQueueNumberService.get(
          '/api/v1/patient/queue/');
      if (response.statusCode == 200) {
        return QueueNumberDto.fromJson(jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        throw UnauthorizedException();
      } else {
        throw ApiException(response.statusCode, response.body);
      }
    } on SocketException {
      throw NetworkException('No internet connection');
    } on TimeoutException {
      throw NetworkException('Request timed out');
    }
  }
}