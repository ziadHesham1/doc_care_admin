import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:googleapis_auth/auth_io.dart';

class NotificationNetwork {
  final Dio _dio;
  NotificationNetwork(Dio dio) : _dio = dio;
  pushNotification() async {
    const data = {
      "message": {
        "condition": "'topic1' in topics || 'topic2' in topics",
        "notification": {
          "title": "Notification Title",
          "body": "This is the body of the notification."
        },
        "data": {
          "key1": "value1",
          "key2": "value2",
          "to": "{\"name\": \"request\", \"id\": 496}"
        }
      }
    };
    final token = await _getAccessToken();
    var headers = {'Authorization': 'Bearer $token'};
    // var data = body.toJson();
    var response = await _dio.post(
      'https://fcm.googleapis.com/v1/projects/docdoc-3d742/messages:send',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }

  Future<String> _getAccessToken() async {
    final serviceAccountJson = await File(
            '/Users/zeadhesham/Documents/GitHub/doc_care/doc_care_admin/assets/firebase_service_account.json')
        .readAsString();
    final ServiceAccountCredentials serviceAccountCredentials =
        ServiceAccountCredentials.fromJson(serviceAccountJson);

    // Define the scopes required
    final scopes = ['https://www.googleapis.com/auth/cloud-platform'];

    // Obtain an authenticated client
    final httpClient =
        await clientViaServiceAccount(serviceAccountCredentials, scopes);

    // Return the access token
    return httpClient.credentials.accessToken.data;
  }
}
