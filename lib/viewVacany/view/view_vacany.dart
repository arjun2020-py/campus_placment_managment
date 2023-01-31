import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crms/viewDetailsScreen/view/view_details_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bottomNavigation/view/bottom_navigation.dart';

class ViewJob extends StatefulWidget {
  ViewJob({super.key});

  @override
  State<ViewJob> createState() => _ViewJobState();
}

class _ViewJobState extends State<ViewJob> {
  CollectionReference jobColl =
      FirebaseFirestore.instance.collection('job_vacancy');

  final auth = FirebaseAuth.instance;

  bool searchState = false;

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
        centerTitle: true,
        title: !searchState
            ? const Text('View Vacancy')
            : TextFormField(
                decoration: const InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: 'Search....',
                    hintStyle: TextStyle(color: Colors.white)),
                onChanged: (value) {
                  searchMethod(value);
                },
              ),
        actions: [
          if (!searchState)
            IconButton(
              onPressed: () {
                setState(() {
                  searchState = !searchState;
                });
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            )
          else
            IconButton(
              onPressed: () {
                setState(() {
                  searchState = !searchState;
                });
              },
              icon: const Icon(
                Icons.cancel,
                color: Colors.white,
              ),
            )
        ],
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
                      builder: (context) =>
                          DetailsViewScreen(DetailsJob: jObItms[index]),
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

Future<void> searchMethod(String value) async {
  ListView.builder(
    itemCount: 1,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        title: Text('data'),
      );
    },
  );
}
