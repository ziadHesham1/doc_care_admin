import 'package:doc_care_admin/core/di/di.dart';
import 'package:doc_care_admin/features/doctor_profile/doctor_personal_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_navbar.dart';
import '../../features/doctor_profile/widgets/doctor_reviews_widget.dart';
import '../../features/home/logic/home_cubit.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/auth/login/logic/login_cubit.dart';
import '../../features/auth/login/ui/login_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/auth/sign_up/logic/signup_cubit.dart';
import '../../features/auth/sign_up/ui/sign_up_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // this argument to be used in any screen like this (argument as ClassName)
    // var argument = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.homeScreen:
        return home();

      case Routes.reviewsScreen:
        return MaterialPageRoute(
          builder: (_) => const ReviewsScreen(),
        );
      case Routes.doctorPersonalInfoScreen:
        return MaterialPageRoute(
          builder: (_) => const DoctorPersonalInfoScreen(),
        );

      case Routes.navbar:
        return navbar();
      default:
        null;
    }
    return null;
  }

  MaterialPageRoute<dynamic> home() {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => getIt<HomeCubit>()..getSpecializations(),
        child: const HomeScreen(),
      ),
    );
  }

  MaterialPageRoute<dynamic> navbar() {
    return MaterialPageRoute(
      builder: (_) => const AppNavbar(),
    );
  }
}
