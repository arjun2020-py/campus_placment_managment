import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crms/bottomNavigation/bottom_navigation.dart';
import 'package:crms/myJob/view/detaild_my_job.dart';
import 'package:crms/viewVacany/view_vacany.dart';
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
  final _auth = FirebaseAuth.instance;

  CollectionReference detailsMyJob =
      FirebaseFirestore.instance.collection('aplied_jobs').get();

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
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream: detailsMyJob
                .where('addVacanyId', isEqualTo: _auth.currentUser!.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  if (snapshot.hasData) {
                    final viewItems = snapshot.data!.docs;
                    print(viewItems);
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetaildMyJobScreen(),
                        ),
                      ),
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viewItems[index]['jobTile'].toString(),
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 06.h,
                            ),
                            Text("myJob['comapnyName'].toString()"),
                            SizedBox(
                              height: 0.6.h,
                            ),
                            const Text('Caicut, Kerala'),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Applied on  10/01/21',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 15.sp),
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
                                Text(
                                    'Around 11-15 people have applied on Indeed')
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              );
            }),
      ),
    );
  }
}
