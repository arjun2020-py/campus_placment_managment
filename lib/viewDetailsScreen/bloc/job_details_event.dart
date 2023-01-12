part of 'job_details_bloc.dart';

@immutable
abstract class JobDetailsEvent {}

class ApplyJob extends JobDetailsEvent {
  ApplyJob({required this.jobId});
  String jobId;
}

class ResumeScreen extends JobDetailsEvent {
  
}
