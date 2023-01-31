part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class dashboadSusessState extends HomeScreenState {
  dashboadSusessState({required this.totalJobs,required this.appliedJobs});
  int totalJobs;
  int appliedJobs;
}

class dashboadFailedState extends HomeScreenState {}
