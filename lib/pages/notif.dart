import 'package:awesome_notifications/awesome_notifications.dart';


class ControleNot {
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatMethod(
    ReceivedNotification receivedNotification) async {}

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
    ReceivedNotification receivedNotification) async {}

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceviedMethod(
    ReceivedNotification receivedNotification) async {}

  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
    ReceivedNotification receivedNotification) async {}
}