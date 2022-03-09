import 'package:budget_app/cubits/appCubit/app_cubit.dart';
import 'package:budget_app/cubits/navigationCubit/navigation_cubit.dart';
import 'package:budget_app/models/categoryModel/category_model.dart';
import 'package:budget_app/models/customerModel/customer_model.dart';
import 'package:budget_app/models/movementModel/movement_model.dart';
import 'package:budget_app/models/userModel/user_model.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:budget_app/views/home_view.dart';
import 'package:budget_app/views/login_view.dart';
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

  final userBox = await Hive.openBox<UserModel>('User');

  runApp(MyApp(userBox: userBox));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.userBox}) : super(key: key);

  final Box<UserModel> userBox;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => UserRepository(userBox: userBox),
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
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
