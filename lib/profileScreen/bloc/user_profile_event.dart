part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileEvent {}

class ProfileScreenEvent extends UserProfileEvent {

  ProfileScreenEvent({required this.image});
  XFile? image;
}
