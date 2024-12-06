import 'package:doc_care_admin/core/di/di.dart';
import 'package:doc_care_admin/core/routing/app_router.dart';
import 'package:doc_care_admin/firebase_options.dart';
import 'package:doc_care_core/core/di/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'doc_care_admin_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await AdminDependencyInjection().registerSingleton();
  ServiceLocator.init(GetIt.instance);

  // await getIt<MessagingService>().init();

  runApp(DocCareAdminApp(
    appRouter: AppRouter(),
  ));
}
