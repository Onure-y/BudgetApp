class TimerPackage {
  static int getCurrentTime() {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    return timestamp;
  }

  static String getCurrentDay(int epoch) {
    DateTime currentDateTime = DateTime.now();
    int day = currentDateTime.day;
    return day.toString();
  }

  static int getCurrentYear(int epoch) {
    DateTime currentDateTime = DateTime.now();
    int year = currentDateTime.year;
    return year;
  }

  static int getCurrentMonth(int epoch) {
    DateTime currentDateTime = DateTime.now();
    int month = currentDateTime.month;
    return month;
  }
}
