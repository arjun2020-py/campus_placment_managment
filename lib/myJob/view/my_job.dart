import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crms/bottomNavigation/bottom_navigation.dart';
import 'package:crms/myJob/view/detaild_my_job.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyJobScreen extends StatefulWidget {
  MyJobScreen({
    super.key,
  });
  // QueryDocumentSnapshot<Object?> myJob;

  @override
  State<MyJobScreen> createState() => _MyJobScreenState();
}

class _MyJobScreenState extends State<MyJobScreen> {
  Future<List<DocumentSnapshot<Map<String, dynamic>>>>? _aplliedJobs;

  @override
  void initState() {
    super.initState();
    _aplliedJobs = getAppliedJobs();
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> getAppliedJobs() async {
    final auth = FirebaseAuth.instance;

    final appliedJobsCollection =
        FirebaseFirestore.instance.collection('aplied_jobs');

    final jobsCollection = FirebaseFirestore.instance.collection('job_vacancy');

    final myJobs = await appliedJobsCollection
        .where(
          'userId',
          isEqualTo: auth.currentUser!.uid,
        )
        .get();

    final myJobIds = <String>[];

    final aplliedJobs = <DocumentSnapshot<Map<String, dynamic>>>[];

    for (final element in myJobs.docs) {
      myJobIds.add(element['jobId'].toString());
    }

    for (var i = 0; i < myJobIds.length; i++) {
      // aplliedJobs.add(jobsCollection.doc(myJobIds[i]));
      final data = await jobsCollection.doc(myJobIds[i]).get();
      aplliedJobs.add(data);
    }
    return aplliedJobs;
    // print(aplliedJobs);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const BottomNaivgation(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          'My jobs',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: FutureBuilder(
        future: _aplliedJobs,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            final jobData = snapshot.data;
            return ListView.builder(
              itemCount: jobData!.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetaildMyJobScreen(),
                  )),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          //   " Flutter Developer",
                          jobData[index]['jobTile'].toString(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 06.h,
                        ),
                        Text(jobData[index]['comapnyName'].toString()
                            // "Hyper Tech Sloution",
                            ),
                        SizedBox(
                          height: 0.6.h,
                        ),
                        const Text('Caicut, Kerala'),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Applied on  10/01/21',
                          style:
                              TextStyle(color: Colors.black45, fontSize: 15.sp),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.flash_on),
                            SizedBox(
                              width: 10.w,
                            ),
                            const Text(
                              'This employer typically responds within 11 days',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 06.h,
                        ),
                        Row(
                          children: const [
                            Icon(Icons.group),
                            Text('Around 11-15 people have applied on Indeed')
                          ],
                        ),
                      ],
                    ),
                  ),
                );
                // return ListTile(
                //   title: Text(jobData[index]['jobTile'].toString()),
                // );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      // body: ListView.builder(
      //   itemCount: _aplliedJobs!.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(
      //       title: Text(aplliedJobs[index]['jobTile'].toString()),
      //     );
      //   },
      // ),
      // body: SafeArea(
      //   child: StreamBuilder<QuerySnapshot>(
      //       stream: jobsCollection.where('id', isEqualTo: 'sdfbs').snapshots(),
      //       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //         return ListView.builder(
      //           itemCount: 10,
      //           itemBuilder: (BuildContext context, int index) {
      //             if (snapshot.hasData) {
      //               final viewItems = snapshot.data!.docs;
      //               print(viewItems);
      //               return InkWell(
      //                 onTap: () => Navigator.of(context).push(
      //                   MaterialPageRoute(
      //                     builder: (context) => DetaildMyJobScreen(),
      //                   ),
      //                 ),
      //                 child: Card(
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         " Flutter Developer",
      //                         style: TextStyle(
      //                           fontSize: 16.sp,
      //                           fontWeight: FontWeight.w700,
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         height: 06.h,
      //                       ),
      //                       Text("Hyper Tech Sloution"),
      //                       SizedBox(
      //                         height: 0.6.h,
      //                       ),
      //                       const Text('Caicut, Kerala'),
      //                       SizedBox(
      //                         height: 10.h,
      //                       ),
      //                       Text(
      //                         'Applied on  10/01/21',
      //                         style: TextStyle(
      //                             color: Colors.black45, fontSize: 15.sp),
      //                       ),
      //                       SizedBox(
      //                         height: 15.h,
      //                       ),
      //                       Row(
      //                         children: [
      //                           const Icon(Icons.flash_on),
      //                           SizedBox(
      //                             width: 10.w,
      //                           ),
      //                           const Text(
      //                             'This employer typically responds within 11 days',
      //                           )
      //                         ],
      //                       ),
      //                       SizedBox(
      //                         height: 06.h,
      //                       ),
      //                       Row(
      //                         children: const [
      //                           Icon(Icons.group),
      //                           Text(
      //                               'Around 11-15 people have applied on Indeed')
      //                         ],
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               );
      //             } else {
      //               return Center(child: CircularProgressIndicator());
      //             }
      //           },
      //         );
      //       }),
      // ),
    );
  }
}
