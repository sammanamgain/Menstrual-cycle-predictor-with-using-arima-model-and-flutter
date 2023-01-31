import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController {
  Timer? _timer;
  int remainingDays = 10;
  final time = '10'.obs;

  @override
  void onReady() {
    _startTimer();
    super.onReady();
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  _startTimer() {
    const duration = Duration(seconds: 86400);
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingDays == 0) {
        timer.cancel();
      } else {
        time.value = "$remainingDays";
        remainingDays--;
      }
    });
  }
}
