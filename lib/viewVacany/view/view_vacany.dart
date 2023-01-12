import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crms/viewDetailsScreen/view/view_details_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bottomNavigation/view/bottom_navigation.dart';

class ViewJob extends StatelessWidget {
  ViewJob({super.key});

  CollectionReference jobColl =
      FirebaseFirestore.instance.collection('job_vacancy');
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const BottomNaivgation(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('View Vacancy'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: jobColl.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final jObItms = snapshot.data!.docs;

            return ListView.builder(
              itemCount: jObItms.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>  DetailsViewScreen(DetailsJob: jObItms[index]),
                    ),
                  ),
                  child: Container(
                    child: SizedBox(
                      height: 80.h,
                      child: Card(
                        child: ListTile(
                          leading: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 150.r),
                                child: Text(
                                  jObItms[index]['jobTile'].toString(),
                                  style: TextStyle(
                                    fontSize: 15.r,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 140.r),
                                child: Text(
                                  jObItms[index]['comapnyName'].toString(),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 150.r),
                                child: Text(
                                  jObItms[index]['jobLocation'].toString(),
                                ),
                              ),
                            ],
                          ),
                          trailing: TextButton(
                            onPressed: () {},
                            child: const Text('View'),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
