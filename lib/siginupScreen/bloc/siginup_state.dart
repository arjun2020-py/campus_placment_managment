part of 'siginup_bloc.dart';

@immutable
abstract class SiginupState {}

class SiginupInitial extends SiginupState {}
class SiginupAuthSucess extends SiginupState {}

class SiginupAuthFailed extends SiginupState {

}