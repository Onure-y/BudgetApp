import 'package:budget_app/components/app_loading.dart';
import 'package:budget_app/cubits/userCubit/user_cubit.dart';
import 'package:budget_app/cubits/userCubit/user_state.dart';
import 'package:budget_app/repositories/user_repository.dart';
import 'package:budget_app/views/home_view.dart';
import 'package:budget_app/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogicPage extends StatelessWidget {
  const LogicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = context.read<UserRepository>();

    return BlocProvider(
      create: (context) => UserCubit(userRepository: userRepository),
      child: BlocBuilder<UserCubit, UserState>(
          builder: (BuildContext context, UserState state) {
        if (state is UserLoadingState) {
          return const AppLoadingComp();
        }
        if (state is UserExistState) {
          return const HomePage();
        }
        if (state is UserNotExistState) {
          return const UserCreatePage();
        } else {
          return Container();
        }
      }),
    );
  }
}
