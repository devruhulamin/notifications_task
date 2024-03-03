import 'package:notification_app/features/notifications/data/entities/notification.dart';

class NotificationsModel extends NotificationEntity {
  NotificationsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    image = json['image'];
    title = json['title'];
    description = json['description'];
    readStatus = json['read_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }
}
