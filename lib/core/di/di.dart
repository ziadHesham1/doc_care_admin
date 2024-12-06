import 'package:dio/dio.dart';
import 'package:doc_care_admin/core/networking/api_service.dart';
import 'package:doc_care_admin/features/auth/login/data/repos/login_repo.dart';
import 'package:doc_care_admin/features/auth/login/logic/login_cubit.dart';
import 'package:doc_care_admin/features/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:doc_care_admin/features/auth/sign_up/logic/signup_cubit.dart';
import 'package:doc_care_admin/features/home/data/apis/home_api_service.dart';
import 'package:doc_care_admin/features/home/data/repos/home_repo.dart';
import 'package:doc_care_admin/features/home/logic/home_cubit.dart';
import 'package:doc_care_admin/features/notifications/data/network/notifications_network.dart';
import 'package:doc_care_admin/features/notifications/data/repo/notification_repo.dart';
import 'package:doc_care_core/core/networking/dio_factory.dart';
import 'package:get_it/get_it.dart';

import 'di.export.dart';

/// Instance of Get It
final GetIt getIt = GetIt.instance;

class AdminDependencyInjection {
  static final AdminDependencyInjection _singleton =
      AdminDependencyInjection._();

  factory AdminDependencyInjection() => _singleton;

  AdminDependencyInjection._();

  Future<void> registerSingleton() async {
    Dio dio = await DioFactory.getDio();
    getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

    ServiceLocator().sl.registerLazySingleton(() => NotificationNetwork(dio));
    ServiceLocator().sl.registerLazySingleton(() => NotificationRepo(getIt()));

    // login repo & cubit
    getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
    getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

    // signup repo & cubit
    getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
    getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
    // home
    getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
    getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));

    getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
    // --> FCM <--
    ServiceLocator().sl.registerLazySingleton(() => AdminFcmService());
    ServiceLocator().sl.registerLazySingleton(() => MessagingService(
          fcmResources: ServiceLocator().sl<AdminFcmService>(),
        ));
  }
}
