import 'package:budget_app/cubits/exampleCubit/example_cubit.dart';
import 'package:budget_app/cubits/exampleCubit/example_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamplePage extends StatelessWidget {
  ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExampleCubit(),
      child: Container(
        child: BlocBuilder<ExampleCubit, ExampleState>(
          builder: (BuildContext context, ExampleState state) {
            if (state is ExampleLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is ExampleLoadedState) {
              return Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<ExampleCubit>().increment();
                          debugPrint(state.counter.toString());
                        },
                        child: Text('+'),
                      ),
                      Text(
                        state.counter.toString(),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
