import 'package:doc_care_core/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/admin_constants.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class DocCareAdminApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocCareAdminApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Doc Admin',
        theme: ThemeData(
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: const Color(0xffff6f6f6),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xffff6f6f6),
            surfaceTintColor: Color(0xffff6f6f6),
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: AppColors.secondary,
            primary: AppColors.primary,
          ),
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: isLoggedInUser ? Routes.navbar : Routes.loginScreen,
        // initialRoute: Routes.newAppointmentScreen,
      ),
    );
  }
}
