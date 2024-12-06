import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/about_doctor_widget.dart';
import 'widgets/doctor_personal_data.dart';
import 'widgets/doctor_reviews_widget.dart';

class DoctorPersonalInfoScreen extends StatelessWidget {
  const DoctorPersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('Doctor Details'),
          ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                const DoctorPersonalData(),
                const AboutDoctorWidget(),
                const DoctorReviewsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
