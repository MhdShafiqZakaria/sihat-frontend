import 'package:flutter_test_sihat/dto/queue/queue_number_dto.dart';
import 'package:flutter_test_sihat/networking/queue/get_queue_number_service.dart';

class QueueFeeder {
  final GetQueueNumberService getQueueNumberService;

  QueueFeeder(this.getQueueNumberService);

  Future<QueueNumberDto> fetchUserQueueTicket() async {
    return await getQueueNumberService.getUserQueueTicket();
  }
}
