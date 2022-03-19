class TimerPackage {
  static int getCurrentTime() {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    return timestamp;
  }
}
