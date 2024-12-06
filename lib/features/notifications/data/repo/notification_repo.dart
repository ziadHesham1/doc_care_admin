import 'package:doc_care_core/core/networking/api_error_handler.dart';
import 'package:doc_care_core/core/networking/api_result.dart';

import '../network/notifications_network.dart';

class NotificationRepo {
  final NotificationNetwork _notificationsNetwork;

  NotificationRepo(NotificationNetwork notificationsNetwork)
      : _notificationsNetwork = notificationsNetwork;

  Future<ApiResult<bool>> pushNotification() async {
    try {
      await _notificationsNetwork.pushNotification();
      return const ApiResult.success(true);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
