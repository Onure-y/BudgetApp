import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {}

class ProfileInitalState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoadingState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoadedState extends ProfileState {
  @override
  List<Object?> get props => [];
}
