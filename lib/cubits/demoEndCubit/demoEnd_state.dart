import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class DemoEndPageState extends Equatable {}

class DemoEndPageInitalState extends DemoEndPageState {
  @override
  List<Object?> get props => [];
}

class DemoEndPageLoadingState extends DemoEndPageState {
  @override
  List<Object?> get props => [];
}

class DemoEndPageLoadedState extends DemoEndPageState {
  DemoEndPageLoadedState({
    required this.demoTextField,
    required this.isDemoCodeCheckedTrue,
  });
  final TextEditingController demoTextField;
  final bool isDemoCodeCheckedTrue;
  @override
  List<Object?> get props => [demoTextField, isDemoCodeCheckedTrue];
}
