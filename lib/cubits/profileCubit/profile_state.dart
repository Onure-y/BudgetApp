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
  ProfileLoadedState({
    required this.fullName,
    required this.companyName,
    required this.isPremium,
    required this.remainingDay,
  });
  final String fullName;
  final String companyName;
  final bool isPremium;
  final int remainingDay;
  @override
  List<Object?> get props => [fullName, companyName, isPremium, remainingDay];
}
