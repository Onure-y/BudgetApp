import 'package:budget_app/helper/timer_package.dart';
import 'package:budget_app/models/settingsModel/setting_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SettingsRepository {
  SettingsRepository({required this.settingsBox});
  final Box<SettingsModel> settingsBox;
  String settingsDataKey = 'settings';

  SettingsModel emptySettingsModel = SettingsModel(
    demoStartTime: 0,
    demoEndTime: 0,
    isPremium: false,
  );

  Future createEstimatedTime() async {
    DateTime currentTime =
        DateTime.fromMillisecondsSinceEpoch(TimerPackage.getCurrentTime());
    DateTime demoEndTime = currentTime.add(const Duration(seconds: 20));

    int demoEndTimestamp = demoEndTime.millisecondsSinceEpoch;
    bool isPremium = false;

    debugPrint('a $demoEndTimestamp');

    SettingsModel settingsModel = SettingsModel(
      demoStartTime: currentTime.millisecondsSinceEpoch,
      demoEndTime: demoEndTimestamp,
      isPremium: isPremium,
    );
    settingsBox.put(settingsDataKey, settingsModel);
  }

  Future<SettingsModel> getDemoData() async {
    SettingsModel demoData =
        await settingsBox.get(settingsDataKey) ?? emptySettingsModel;
    debugPrint(demoData.demoStartTime.toString());
    return demoData;
  }

  Future resetData() async {
    settingsBox.put(settingsDataKey, emptySettingsModel);
  }
}
