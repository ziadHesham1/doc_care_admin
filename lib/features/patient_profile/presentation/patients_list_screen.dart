import 'package:doc_care_core/core/helpers/app_assets.dart';
import 'package:doc_care_core/core/widgets/app_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../home/data/models/specialization_model.dart';

class PatientItemWidget extends StatelessWidget {
  final Doctor patient;
  const PatientItemWidget({
    super.key,
    required this.patient,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppImageWidget(
            imageUrl: patient.photo,
          ),
          SizedBox(width: 20.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  patient.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  '${patient.degree} | ${patient.phone}',
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  patient.email,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PatientsListView extends StatelessWidget {
  final List<Doctor> patients;
  const PatientsListView({super.key, required this.patients});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) =>
            PatientItemWidget(patient: patients[index]),
        itemCount: patients.length,
      ),
    );
  }
}

class PatientsListScreen extends StatelessWidget {
  const PatientsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patients'),
      ),
      body: PatientsListView(
          patients: List.generate(
              12,
              (index) => Doctor(
                    name: 'Dr. John Doe',
                    photo: AppAssets.profile_image,
                    degree: 'MBBS, MD, FRCS',
                    phone: '1234567890',
                    email: '1LlRd@example.com',
                    address: '123 Main St, Anytown, USA',
                    appointPrice: 1000,
                    city: City(
                      id: 1,
                      name: 'Anytown',
                      governorate: Governorate(id: 1, name: 'name'),
                    ),
                    description: 'tt',
                    endTime: '10:00 AM',
                    gender: 'F',
                    id: 1,
                    startTime: '10:00 AM',
                  ))),
    );
  }
}
