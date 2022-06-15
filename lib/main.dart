import 'package:budget_app/cubits/appCubit/app_cubit.dart';
import 'package:budget_app/cubits/navigationCubit/navigation_cubit.dart';
import 'package:budget_app/models/categoryModel/category_model.dart';
import 'package:budget_app/models/customerModel/customer_model.dart';
import 'package:budget_app/models/movementModel/movement_model.dart';
import 'package:budget_app/models/settingsModel/setting_model.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/settings_repository.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:budget_app/views/logic_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<CategoryModel>(CategoryModelAdapter());
  Hive.registerAdapter<UserModel>(UserModelAdapter());
  Hive.registerAdapter<CustomerModel>(CustomerModelAdapter());
  Hive.registerAdapter<MovementModel>(MovementModelAdapter());
  Hive.registerAdapter<SettingsModel>(SettingsModelAdapter());

  final userBox = await Hive.openBox<UserModel>('User');
  final settingBox = await Hive.openBox<SettingsModel>('Settings');

  runApp(MyApp(userBox: userBox, settingBox: settingBox));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.userBox,
    required this.settingBox,
  }) : super(key: key);

  final Box<UserModel> userBox;
  final Box<SettingsModel> settingBox;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(
          create: (context) => UserRepository(
            userBox: userBox,
          ),
        ),
        RepositoryProvider<SettingsRepository>(
          create: (context) => SettingsRepository(
            settingsBox: settingBox,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppCubit(),
          ),
          BlocProvider(
            create: (context) => NavigationCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'HesApp',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const LogicPage(),
        ),
      ),
    );
  }
}
