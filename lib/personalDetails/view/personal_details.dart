import 'package:crms/FillApplication/view/fill_application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class PersonalDetails extends StatefulWidget {
  PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  String? gender; //no radio button will be selected on initial

  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        title: Padding(
          padding: EdgeInsets.only(right: 60.r),
          child: const Center(child: Text('Personal Details')),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 260.r, top: 20.r),
              child: Text(
                'Full name:',
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                hintText: 'Enter your full name',
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 270.r),
              child: Text(
                'Email Id:',
                style: TextStyle(fontSize: 15.sp),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                hintText: 'Enter email id',
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 260.r),
              child: const Text('Mobile No:'),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                hintText: 'Enter Mobile no',
              ),
            ),
            RadioButton(), //radio button

            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 260.r),
              child: const Text('Address:'),
            ),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                hintText: 'Enter address here',
              ),
            ),
            SizedBox(
              height: 10.r,
            ),
            Padding(
              padding: EdgeInsets.only(right: 270.r),
              child: const Text('Age:'),
            ),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                hintText: 'enter age',
              ),
            ),
            SizedBox(
              height: 10.r,
            ),
            Padding(
              padding: EdgeInsets.only(right: 270.r),
              child: const Text('D.O.B:'),
            ),
            TextFormField(
              decoration: InputDecoration(
                suffix: IconButton(
                    onPressed: () async {
                      var pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1995),
                        lastDate: DateTime(2101),
                      );

                      // ignore: unnecessary_null_checks
                      if (pickeddate != null) {
                        setState(() {
                          _date.text =
                              DateFormat('yyyy-MM-dd').format(pickeddate);
                        });
                      }
                    },
                    icon: Icon(Icons.calendar_today_sharp)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                hintText: 'enter date of birth',
              ),
              controller: _date,
            ),
            SizedBox(
              height: 10.r,
            ),
            SizedBox(
              width: 200.w,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FillApplication(),
                    ),
                  );
                },
                // ignore: sort_child_properties_last
                child: const Text(
                  'Submit',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff227C70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//radio button code
  Column RadioButton() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 260.r, top: 20.r),
          child: Text(
            'Gender:',
            style: TextStyle(fontSize: 16.sp),
          ),
        ),
        RadioListTile(
          title: const Text('Male'),
          value: 'male',
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        ),
        RadioListTile(
          title: const Text('Female'),
          value: 'female',
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        ),
        RadioListTile(
          title: const Text('Other'),
          value: 'other',
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value.toString();
            });
          },
        ),
      ],
    );
  }
}
