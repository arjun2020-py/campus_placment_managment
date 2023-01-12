import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetaildMyJobScreen extends StatelessWidget {
  DetaildMyJobScreen({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff579BB1),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff579BB1),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: SafeArea(
        child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 600.h,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.r),
                      child: Card(
                        color: const Color(0xffffffff),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 100.h,
                              child: Card(
                                color: const Color(0xffe4f7e6),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                    Text('Application submitted'),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Flutter Mobile App Developer',
                              style: TextStyle(
                                fontSize: 15.r,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            const Text('ALB TECHNOLOGIES, Infopark'),
                            SizedBox(
                              height: 6.h,
                            ),
                            const Text('Kochi, Kerala'),
                            SizedBox(
                              height: 6.h,
                            ),
                            SizedBox(
                              height: 40.h,
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Card(
                                  color: Color(0xffeae9e8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.currency_rupee,
                                        size: 15.sp,
                                      ),
                                      const Text('12,000'),
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
                                      const Text('20,000'),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      const Text('a month')
                                    ],
                                  ),
                                ),
                              ),
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
                            const Text(
                              'We at Butomy are looking for strong Flutter App developers for our App development team. As a Senior Flutter Developer, who shall be responsible for the development, enhancement and maintenance of cross-platform applications for our clients.',
                              style: TextStyle(),
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.person_add),
                                SizedBox(
                                  width: 10.w,
                                ),
                                const Text('Hiring 3 candidates for this role')
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.circle_rounded,
                                  size: 10.r,
                                ),
                                const Text('Posted '),
                                SizedBox(
                                  width: 5.w,
                                ),
                                const Text('01/02/23'),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 0.r),
                                  child: Icon(
                                    Icons.circle_rounded,
                                    size: 10.r,
                                  ),
                                ),
                                const Text('Removed'),
                                SizedBox(
                                  width: 8.w,
                                ),
                                const Text('07/01/23')
                              ],
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.r),
                              child: Row(
                                children: [
                                  // ElevatedButton(
                                  //   onPressed: () {},
                                  //   child: const Text('Apply now'),
                                  //   style: ElevatedButton.styleFrom(
                                  //     shape: RoundedRectangleBorder(
                                  //       borderRadius: BorderRadius.circular(15),
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  // Card(
                                  //     color: const Color(0xffe4e2e0),
                                  //     shape: RoundedRectangleBorder(
                                  //         borderRadius: BorderRadius.circular(5.r)),
                                  //     child:
                                  //         const Icon(Icons.favorite_border_outlined))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      )  
      
    );
  }
}
