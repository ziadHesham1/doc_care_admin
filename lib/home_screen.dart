import 'package:flutter/material.dart';

import 'core/di/di.dart';
import 'features/notifications/data/repo/notification_repo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            child: const Text('push'),
            onPressed: () {
              getIt<NotificationRepo>().pushNotification();
            }),
      ),
    );
  }
}
