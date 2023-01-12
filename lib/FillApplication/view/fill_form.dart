import 'package:crms/FillApplication/view/details_fill_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FillFormScreen extends StatelessWidget {
  const FillFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        title: const Text('Fill Appliocation'),
      ),
      body: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        color: const Color(0xffE1D7C6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Find  ',
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  Text(
                    'Jobs',
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: const Color.fromARGB(255, 35, 97, 204),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Row(
                    children: [
                      Text(
                        'Globally  with CRMS,',
                        style: TextStyle(fontSize: 20.sp),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Free',
                  style: TextStyle(
                      fontSize: 20.sp, color: const Color(0xffD3756B)),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'to join',
                  style: TextStyle(fontSize: 20.sp),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 45.h,
              width: 200.w,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailsFormScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff579BB1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  side: BorderSide(width: 3.w, color: const Color(0xff144272)),
                ),
                child: const Text('REGISTER HERE'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
