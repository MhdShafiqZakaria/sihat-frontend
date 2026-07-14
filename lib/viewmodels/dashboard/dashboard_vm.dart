import 'package:flutter/foundation.dart';
import 'package:flutter_test_sihat/dto/queue/queue_number_dto.dart';
import 'package:flutter_test_sihat/networking/queue/queue_feeder.dart';

class DashboardVm extends ChangeNotifier {
  final QueueFeeder queueFeeder;

  DashboardVm(this.queueFeeder);

  QueueNumberDto? queueNumberDto;
  bool isloading = false;
  String? errorMessage;

  Future<void> loadQueueData() async {
    isloading = true;
    errorMessage = null;
    notifyListeners();

    try {
      queueNumberDto = await queueFeeder.fetchUserQueueTicket();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isloading = false;
      notifyListeners();
    }
  }
}
