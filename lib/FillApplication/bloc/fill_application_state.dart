part of 'fill_application_bloc.dart';

@immutable
abstract class FillApplicationState {}

class FillApplicationInitial extends FillApplicationState {}

class FillApplicationSucess extends FillApplicationState {}

class FillApplicationFailed extends FillApplicationState {}
