import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {}

class NavigationInitial extends NavigationState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class NavigationLoading extends NavigationState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class NavigationLoaded extends NavigationState {
  NavigationLoaded(this.onTapState);

  final List<bool> onTapState;
  @override
  List<Object?> get props => [onTapState];
}
