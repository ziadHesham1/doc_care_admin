import 'package:doc_care_core/core/theming/app_colors.dart';
import 'package:flutter/material.dart';

import 'features/doctor_profile/doctor_profile_screen.dart';
import 'features/home/ui/home_screen.dart';
import 'features/patient_profile/presentation/patients_list_screen.dart';

class AppNavbar extends StatefulWidget {
  const AppNavbar({super.key});

  @override
  State<AppNavbar> createState() => _AppNavbarState();
}

class _AppNavbarState extends State<AppNavbar> {
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screens = [
      const HomeScreen(),
      const PatientsListScreen(),
      const DoctorProfileScreen(),
    ];
    var tabs = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.medical_information),
        label: 'Patients',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ];
    return Scaffold(
        body: screens[tabIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabIndex,
          backgroundColor: const Color(0xffff6f6f6),
          selectedItemColor: AppColors.primary,
          onTap: (value) {
            setState(() {
              tabIndex = value;
            });
          },
          items: tabs,
        ));
  }
}
