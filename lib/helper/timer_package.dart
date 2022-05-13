class TimerPackage {
  static List<String> months = [
    'Ocak',
    'Subat',
    'Mart',
    'Nisan',
    'Mayis',
    'Haziran',
    'Temmuz',
    'Agustos',
    'Eylul',
    'Ekim',
    'Kasim',
    'Aralik',
  ];

  static int getCurrentTime() {
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    return timestamp;
  }

  static String getCurrentDay() {
    DateTime currentDateTime = DateTime.now();
    int day = currentDateTime.day;
    return day.toString();
  }

  static int getCurrentYear() {
    DateTime currentDateTime = DateTime.now();
    int year = currentDateTime.year;
    return year;
  }

  static int getCurrentMonth() {
    DateTime currentDateTime = DateTime.now();
    int month = currentDateTime.month;
    return month;
  }

  static int getDemoTime(int timestamp) {
    DateTime startTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    int lastDemoTime =
        startTime.add(const Duration(days: 14)).millisecondsSinceEpoch;
    return lastDemoTime;
  }

  static int getDifferenceDateTimes(int demoStartTime, int demoEndTime) {
    DateTime demoStartDateTime =
        DateTime.fromMillisecondsSinceEpoch(demoStartTime);
    DateTime demoEndDateTime = DateTime.fromMillisecondsSinceEpoch(demoEndTime);
    Duration diffrenceDateTime = demoEndDateTime.difference(demoStartDateTime);
    int diffrenceDay = diffrenceDateTime.inDays;
    return diffrenceDay;
  }
}
