part of 'job_details_bloc.dart';

@immutable
abstract class JobDetailsEvent {}

class ApplyJob extends JobDetailsEvent {
  ApplyJob({required this.jobId,required this.Status});
  String jobId;
  String Status;
}

class ResumeScreen extends JobDetailsEvent {}
