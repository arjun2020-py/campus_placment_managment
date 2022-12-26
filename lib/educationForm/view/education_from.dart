import 'package:crms/FillApplication/view/fill_application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'education_details_taill.dart';

class EducationFrom extends StatelessWidget {
  const EducationFrom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FillApplication(),
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Education Details'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: EducationDetailsTaill(), //3
        ),
      ),
    );
  }
}

