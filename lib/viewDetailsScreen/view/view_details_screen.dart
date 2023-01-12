import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crms/myJob/my_job.dart';
import 'package:crms/viewDetailsScreen/bloc/job_details_bloc.dart';
import 'package:crms/viewDetailsScreen/view_details_screen.dart';
import 'package:crms/viewVacany/view_vacany.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsViewScreen extends StatelessWidget {
  DetailsViewScreen({super.key, required this.DetailsJob});
  QueryDocumentSnapshot<Object?> DetailsJob;

  JobDetailsBloc _jobDetails = JobDetailsBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _jobDetails,
      child: Scaffold(
        backgroundColor: const Color(0xff579BB1),
        appBar: AppBar(
          backgroundColor: const Color(0xff579BB1),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ViewJob(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 600.h,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.r),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              DetailsJob['jobTile'].toString(),
                              style: TextStyle(
                                fontSize: 15.r,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(DetailsJob['comapnyName'].toString()),
                            SizedBox(
                              height: 6.h,
                            ),
                            Text(DetailsJob['jobLocation'].toString()),
                            SizedBox(
                              height: 6.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.currency_rupee,
                                  size: 15.sp,
                                ),
                                Text(DetailsJob['minSalary'].toString()),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const Text('-'),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Icon(
                                  Icons.currency_rupee,
                                  size: 15.sp,
                                ),
                                Text(DetailsJob['maxSalary'].toString()),
                                SizedBox(
                                  width: 10.w,
                                ),
                                const Text('a month')
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            Text(
                              'Job Decrption:',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              DetailsJob['jobDecrption'].toString(),
                              style: const TextStyle(),
                              maxLines: null,
                              textAlign: TextAlign.justify,
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            Text(
                              'Hiring Insights',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.person_add),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "Hiring ${DetailsJob['vacancyCount'].toString()} candidates for this role",
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'Job activity',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.circle_rounded,
                                  size: 10.r,
                                ),
                                const Text('Posted '),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(DetailsJob['startDate'].toString()),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.r),
                                  child: Icon(
                                    Icons.circle_rounded,
                                    size: 10.r,
                                  ),
                                ),
                                const Text('Removed'),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(DetailsJob['endDate'].toString())
                              ],
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => UploadPdf()));
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text('Upload Resume'),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _jobDetails.add(ApplyJob(
                                    jobId:
                                        DetailsJob['addVacanyId'].toString()));
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => MyJobScreen(),
                                //   ),
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text('Apply now'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
