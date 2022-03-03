import 'package:budget_app/cubits/exampleCubit/example_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExampleCubit extends Cubit<ExampleState> {
  ExampleCubit() : super(ExampleInitalState()) {
    emit(ExampleLoadedState(counter: counter));
  }

  int counter = 0;

  void increment() {
    counter = counter + 1;
    emit(ExampleLoadedState(counter: counter));
  }
}
