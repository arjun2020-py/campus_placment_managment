part of 'siginup_bloc.dart';

@immutable
abstract class SiginupEvent {}

class SiginupAuthEvent extends SiginupEvent {
  SiginupAuthEvent(
      {
        required this.name,
        required this.email,
      required this.mobileNo,
      required this.pass,
      required this.confromPass});

  String name;
  String email;
  String mobileNo;
  String pass;
  String confromPass;
}
