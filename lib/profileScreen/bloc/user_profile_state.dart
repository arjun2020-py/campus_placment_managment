part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState {}

class ProfileScreenSucess extends UserProfileState {
  
}
class ProfileScreenFailed extends UserProfileState {
  
}