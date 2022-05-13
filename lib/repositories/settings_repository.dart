import 'package:budget_app/helper/timer_package.dart';
import 'package:budget_app/models/settingsModel/setting_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsRepository {
  SettingsRepository({required this.settingsBox});
  final Box<SettingsModel> settingsBox;
  String settingsDataKey = 'settings';

  SettingsModel emptySettingsModel = SettingsModel(
    demoEndTime: 0,
    demoStartTime: 0,
    isPremium: false,
  );

  Future<SettingsModel> getSettingsModel() async {
    SettingsModel settingsData =
        settingsBox.get(settingsDataKey) ?? emptySettingsModel;
    SettingsModel settingsModel = checkIfItsEmpty(settingsData);
    return settingsModel;
  }

  SettingsModel checkIfItsEmpty(SettingsModel settingsData) {
    if (settingsData.demoStartTime == 0) {
      SettingsModel createdSettingsData = createDemoTime();
      return createdSettingsData;
    } else {
      return settingsData;
    }
  }

  SettingsModel createDemoTime() {
    int demoStartTime = TimerPackage.getCurrentTime();
    int demoEndTime = TimerPackage.getDemoTime(demoStartTime);
    bool isPremium = false;
    SettingsModel createdSettingsData = SettingsModel(
      demoStartTime: demoStartTime,
      demoEndTime: demoEndTime,
      isPremium: isPremium,
    );
    settingsBox.put(settingsDataKey, createdSettingsData);
    return createdSettingsData;
  }
}
