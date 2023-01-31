import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentCount {
  Future<int> CountStatus(bool type) async {
    print('dfkghdfkgjhdkfgjhdfkjg');
    final _auth = FirebaseAuth.instance;
    final QuerySnapshot totalUsers = await FirebaseFirestore.instance
        .collection('job_vacancy')
        // .where('userId', isEqualTo: _auth.currentUser!.uid)
        .get();
    final userCount = totalUsers.docs.length;
    return userCount;
  }

  Future<int> AppliedJobs(bool type) async {
    final _auth = FirebaseAuth.instance;

    final QuerySnapshot totalUsers =
        await FirebaseFirestore.instance.collection('aplied_jobs').get();

    final AppliedCounts = totalUsers.docs.length;

    return AppliedCounts;
  }
}
