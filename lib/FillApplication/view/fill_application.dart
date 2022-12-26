import 'package:crms/educationForm/view/education_from.dart';
import 'package:crms/personalDetails/personal_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bottomNavigation/view/bottom_navigation.dart';
import 'education_details_card.dart';
import 'personal_details_card.dart';

class FillApplication extends StatelessWidget {
  const FillApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8EC3B0),
      appBar: AppBar(
        backgroundColor: const Color(0xff9ED5C5),
        automaticallyImplyLeading: false,
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
        title: Padding(
          padding: EdgeInsets.only(right: 50.r),
          child: const Center(child: Text(' Fill Application')),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: EdgeInsets.only(top: 50.r),
          child: Container(
            decoration: const BoxDecoration(),
            width: 400.w,
            height: 400.h,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r),
                ),
              ),
              color: const Color(0xff4FA095),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40.r),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PersonalDetails(),
                            ),
                          );
                        },
                        child: PersonalDetailsCard(), //1
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const EducationFrom(),
                          ),
                        );
                      },
                      child: EducationDeatilsCard(), //2
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 200.w,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Submit'),
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff829460),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
