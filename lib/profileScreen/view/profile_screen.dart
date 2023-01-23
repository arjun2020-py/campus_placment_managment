import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crms/profileScreen/bloc/user_profile_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../SherdPref/view/shres_pref.dart';
import '../../loginScreen/view/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final _userProfile = FirebaseFirestore.instance.collection('student_users');
  final _auth = FirebaseAuth.instance;

  //create a object for profileBloc
  XFile? image;
  final profileBloc = UserProfileBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileBloc..add(ProfileScreenEvent(image: image)),
      child: BlocListener<UserProfileBloc, UserProfileState>(
        listener: (context, state) {
          if (state is ProfileScreenSucess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Profle pic is updated')));
          }
        },
        child: Scaffold(
          backgroundColor: Color(0xffDDDDDD),
          body: SafeArea(
            child: SingleChildScrollView(
              //card wrap with stream bilder
              child: StreamBuilder(
                  stream: _userProfile.doc(_auth.currentUser!.uid).snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final userData = snapshot.data!;

                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Color(0xffB7B78A),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Stack(
                                          children: [
                                            CircleAvatar(
                                              radius: 45.r,
                                              backgroundColor: Colors.white,
                                              child:
                                                  (userData['profileImages'] ==
                                                          '')
                                                      ? Text(
                                                          userData['studentName']
                                                                  [0]
                                                              .toString()
                                                              .toUpperCase(),
                                                          style: const TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .blueAccent),
                                                        )
                                                      : ClipOval(
                                                          child: Image.network(
                                                            userData[
                                                                    'profileImages']
                                                                .toString(),
                                                            fit: BoxFit.cover,
                                                            height: 100,
                                                            width: 100,
                                                          ),
                                                        ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(50.r),
                                              child: IconButton(
                                                onPressed: getPic,
                                                icon: const Icon(
                                                  Icons.camera_alt,
                                                  color: Colors.amber,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // SizedBox(
                                        //   width: 20.w,
                                        // ),
                                        // TextButton(
                                        //     onPressed: getPic,
                                        //     child: const Text('upload pic'))
                                      ],
                                    ),
                                    // const SizedBox(
                                    //   height: 8,
                                    // ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: 250.r,
                                      ),
                                      child: Text(
                                        userData['studentName'].toString(),
                                        style: TextStyle(fontSize: 15.sp),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 200.r),
                                      child: Text(userData['email'].toString(),
                                          style: TextStyle(fontSize: 15.sp)),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Card(
                                color: Color(0xff658864),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                // child: ListTile(
                                //   leading: const Icon(Icons.person),
                                //   title: const Text("Student Account"),
                                //   trailing: IconButton(
                                //       onPressed: () {
                                //         ShredPref().getUserData();
                                //       },
                                //       icon: const Icon(Icons.navigate_next)),
                                // ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Card(
                                color: Color(0xff658864),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  leading: const Icon(Icons.notes_rounded),
                                  title: const Text("Genral Statement"),
                                  trailing: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.navigate_next)),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Card(
                                color: Color(0xff658864),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  leading:
                                      const Icon(Icons.help_outline_rounded),
                                  title: const Text(" Help Center"),
                                  trailing: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.navigate_next)),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Card(
                                color: Color(0xff658864),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  leading:
                                      const Icon(Icons.info_outline_rounded),
                                  title: const Text("About Us"),
                                  trailing: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.navigate_next)),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Card(
                                color: Color(0xff658864),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  leading:
                                      const Icon(Icons.settings_input_antenna),
                                  title: const Text(" Settings"),
                                  trailing: IconButton(
                                      onPressed: () {
                                        // Navigator.of(context)
                                        //     .push(MaterialPageRoute(
                                        //   builder: (context) => SettingScreen(),
                                        // ));
                                      },
                                      icon: const Icon(Icons.navigate_next)),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Card(
                                color: Color(0xff658864),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  onTap: () {},
                                  leading: const Icon(Icons.logout_outlined),
                                  title: const Text("Logout"),
                                  trailing: IconButton(
                                      onPressed: () {
                                        ShredPref().removeUserData();
                                        Navigator.of(context)
                                            .pushReplacement(MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ));
                                      },
                                      icon: const Icon(Icons.navigate_next)),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
            ),
          ),
        ),
      ),
    );
  }

  //get images from mobile
  Future<void> getPic() async {
    final _imagepicker = ImagePicker();
    try {
      final image = await _imagepicker.pickImage(source: ImageSource.gallery);
    } catch (e) {
      print(e);
    }
  }

  // Future<void> updateProfilePic(XFile image) async {
  //   final refernce =
  //       FirebaseStorage.instance.ref().child('profileImages').child(image.name);
  //   final file = File(image.path); //assgin local path to file.
  //   await refernce.putFile(file);
  //   final imageLink = await refernce.getDownloadURL();

  //   await _userProfile
  //       .doc(_auth.currentUser!.uid)
  //       .update({'profileImages': imageLink});
  //   print(imageLink);
  // }
}
