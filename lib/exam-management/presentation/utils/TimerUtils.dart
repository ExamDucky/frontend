mixin TimerUtils{

  String formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int secondsRemaining = seconds % 60;
    return "${_twoDigits(hours)}:${_twoDigits(minutes)}:${_twoDigits(secondsRemaining)}";
  }

  String _twoDigits(int n) {
    return n.toString().padLeft(2, '0');
  }
}