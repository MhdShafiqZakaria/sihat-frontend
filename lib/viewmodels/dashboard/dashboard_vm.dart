import 'package:flutter/foundation.dart';
import 'package:flutter_test_sihat/dto/queue/queue_number_dto.dart';
import 'package:flutter_test_sihat/networking/queue/queue_feeder.dart';

import '../../networking/exceptions.dart';

class DashboardVm extends ChangeNotifier {

  final QueueFeeder queueFeeder;

  DashboardVm({required this.queueFeeder});

  QueueNumberDto? queueNumberDto;
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadQueueNumber() async {
    isLoading = true;
    notifyListeners();

    try {
      queueNumberDto = await queueFeeder.fetchUserQueueTicket();
    } on UnauthorizedException {
      errorMessage = 'unauthorized';
    } on ApiException {
      errorMessage = 'Server error';
    } on NetworkException catch (e) {
      errorMessage = e.message;
    } catch (e){
      errorMessage = 'An unexpected error occurred';
    } finally{
      isLoading = false;
      notifyListeners();
    }
  }
}
