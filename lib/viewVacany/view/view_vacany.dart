import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewJob extends StatelessWidget {
  const ViewJob({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: Column(
                  children: [
                    Text(
                      'Flutter Mobile Application Developer',
                      style: TextStyle(
                          fontSize: 15.r, fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 80.r),
                      child: const Text('ALB TECHNOLOGIES, Infopark'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 178.r),
                      child: Text('Kochi, Kerala'),
                    ),
                  ],
                ),
                title: Text(''),
              ),
            );
          },
        ));
  }
}
