import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ExampleState extends Equatable {}

class ExampleInitalState extends ExampleState {
  @override
  List<Object?> get props => [];
}

class ExampleLoadingState extends ExampleState {
  @override
  List<Object?> get props => [];
}

class ExampleLoadedState extends ExampleState {
  ExampleLoadedState({required this.counter});
  final int counter;
  @override
  List<Object?> get props => [counter];
}
