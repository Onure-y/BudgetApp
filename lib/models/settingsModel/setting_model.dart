import 'package:hive/hive.dart';

part 'setting_model.g.dart';

@HiveType(typeId: 4)
class SettingsModel {
  @HiveField(0)
  int demoStartTime;
  @HiveField(1)
  int demoEndTime;
  @HiveField(2)
  bool isPremium;

  SettingsModel({
    required this.demoStartTime,
    required this.demoEndTime,
    required this.isPremium,
  });
}
