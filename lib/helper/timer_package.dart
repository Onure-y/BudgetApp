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
}
