import 'package:crms/FillApplication/bloc/fill_application_bloc.dart';
import 'package:crms/bottomNavigation/bottom_navigation.dart';
import 'package:crms/homeScreen/view/home_screen.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsFormScreen extends StatefulWidget {
  DetailsFormScreen({super.key,});



  @override
  State<DetailsFormScreen> createState() => _DetailsFormScreenState();
}

class _DetailsFormScreenState extends State<DetailsFormScreen> {
  List<Widget> _cardList = [];

  void _addCardWidget() {
    setState(() {
      _cardList.add(_card());
    });
  }

  Widget _card() {
    return Container();
  }

  List<String> jobType = <String>[
    'CONTRACT/PERMANENT JOB',
    'CONTRACT',
    'PERMANENT JOB',
  ];

  String selectedValue = 'CONTRACT/PERMANENT JOB';

  // List<String> yearExp = <String>[
  //   'Fresher',
  //   '1 Year',
  //   '2 Year',
  //   '3 year',
  //   '4 year',
  //   '5 year'
  // ];

  // String dropdwonValue2 = '1 Year';

  List<String> eduLevel = [
    'BACHELORS/DEGREE',
    'DIPLOMA',
    'TENTH',
    'INTERMEDIATE'
  ];

  String selectedEducation = 'BACHELORS/DEGREE';

  final jobTypeController = TextEditingController();

  final _applicationBloc = FillApplicationBloc();

  TextEditingController firstName = TextEditingController(),
      lastName = TextEditingController(),
      email = TextEditingController(),
      mobNo = TextEditingController(),
      country = TextEditingController(),
      city = TextEditingController(),
      jobTitle = TextEditingController(),
      skills = TextEditingController(),
      certifcates = TextEditingController();

 

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _applicationBloc,
      child: BlocListener<FillApplicationBloc, FillApplicationState>(
        listener: (context, state) {
          if (state is FillApplicationSucess) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BottomNaivgation(),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Application Registration is failed')));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Please fill the form',
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'First Name :',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextFormField(
                      controller: firstName,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Last Name :',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextFormField(
                      controller: lastName,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Email :',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      ' Mobile Number :',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextFormField(
                      controller: mobNo,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefix: Text(
                          '+ 91 |',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Country :',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextFormField(
                      controller: country,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'City :',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextFormField(
                      controller: city,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Job Title :',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    //1

                    Text(
                      'Job Type :',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        value: selectedValue,
                        isExpanded: true,
                        icon: const Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 30,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            selectedValue = value!;
                          });
                        },
                        items: jobType
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),

                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),

                    //3
                    Text(
                      'Education level :',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        value: selectedEducation,
                        isExpanded: true,
                        icon: const Icon(
                          Icons.arrow_drop_down_sharp,
                          size: 30,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            selectedEducation = value!;
                          });
                        },
                        items: eduLevel
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                 
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Skills :',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      height: 80.h,
                      child: TextFormField(
                        controller: skills,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Types your skils',
                        ),
                      ),
                    ),
                
                    SizedBox(
                      height: 5.h,
                    ),

                    Text(
                      'Certifications :',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      height: 80.h,
                      child: TextFormField(
                        controller: certifcates,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Types your certifications',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                      
                        SizedBox(
                          width: 10.w,
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 85.r),
                      child: SizedBox(
                        width: 160.w,
                        child: ElevatedButton(
                          onPressed: () => _applicationBloc.add(
                            ApplicationFillEvent(
                              firstName: firstName.text,
                              lastName: lastName.text,
                              email: email.text,
                              mobNo: mobNo.text,
                              country: country.text,
                              city: city.text,
                              jobTitle: jobTitle.text,
                              jobType: selectedValue,
                              educationLevel: selectedEducation,
                              skills: skills.text,
                              Certificates: certifcates.text,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xff227C70),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r))),
                          child: const Text('Save '),
                        ),
                      ),
                    ),
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
