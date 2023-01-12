part of 'job_details_bloc.dart';

@immutable
abstract class JobDetailsState {}

class JobDetailsInitial extends JobDetailsState {}

class JobAppliedSuccess extends JobDetailsState {}

class JobAppliedFailed extends JobDetailsState {}

class ResumeUploadSucess extends JobDetailsState {}

class ResumeUploadFalied extends JobDetailsState {}
