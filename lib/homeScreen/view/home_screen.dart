import 'package:crms/homeScreen/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final homeBloc = HomeScreenBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc..add(DashboadEvent()),
      child: Scaffold(
        backgroundColor: Color(0xff46C2CB),
        appBar: AppBar(
          backgroundColor: Color(0xff6D67E4),
          automaticallyImplyLeading: false,
          title: const Center(child: Text('Dashboad')),
        ),
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Center(
                //   child: SizedBox(
                //     width: 300.w,
                //     height: 100.h,
                //     child: Card(
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: const [
                //           Text('Yesterday Applied Jobs'),
                //           Text('0'),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 150.h,
                ),
                // Center(
                //   child: SizedBox(
                //     width: 300.w,
                //     height: 100.h,
                //     child: Card(
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: const [
                //           Text('Last 7 Days Applied Jobs'),
                //           Text('0'),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                BlocBuilder<HomeScreenBloc, HomeScreenState>(
                  builder: (context, state) {
                    if (state is dashboadSusessState) {
                      return Center(
                        child: SizedBox(
                          width: 300.w,
                          height: 100.h,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Total Applied Jobs'),
                                Text(state.appliedJobs.toString()),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                BlocBuilder<HomeScreenBloc, HomeScreenState>(
                  builder: (context, state) {
                    if (state is dashboadSusessState) {
                      return Center(
                        child: SizedBox(
                          width: 300.w,
                          height: 100.h,
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Total vacancy'),
                                Text(state.totalJobs.toString()),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
