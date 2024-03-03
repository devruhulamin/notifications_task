import 'package:notification_app/core/enums/update_status.dart';

abstract class NotificationsEvent {}

class FetchNotification extends NotificationsEvent {
  FetchNotification();
}

class FetchNotificationWithPage extends NotificationsEvent {
  final int page;
  final int pageSize;

  FetchNotificationWithPage({required this.page, required this.pageSize});
}

class UpdateNotificaton extends NotificationsEvent {
  final UpdateStatus status;

  UpdateNotificaton({required this.status});
}

class ToggleNotificationSelection extends NotificationsEvent {
  final int notificationId;

  ToggleNotificationSelection({required this.notificationId});
}

class SelectAllNotifications extends NotificationsEvent {
  final bool isSelect;

  SelectAllNotifications(this.isSelect);
}

class ClearSelected extends NotificationsEvent {}
