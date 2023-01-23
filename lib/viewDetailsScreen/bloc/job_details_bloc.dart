import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'job_details_event.dart';
part 'job_details_state.dart';

class JobDetailsBloc extends Bloc<JobDetailsEvent, JobDetailsState> {
  JobDetailsBloc() : super(JobDetailsInitial()) {
    on<JobDetailsEvent>((event, emit) {
      if (event is ApplyJob) {
        final CollectionReference apply_jobs =
            FirebaseFirestore.instance.collection('aplied_jobs');

        final auth = FirebaseAuth.instance;

        apply_jobs.add({'userId': auth.currentUser!.uid, 'jobId': event.jobId,'status':''});
        emit(JobAppliedSuccess());
      } else {
        emit(JobAppliedFailed());
      }
    });
  }
}
