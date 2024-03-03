import 'package:either_dart/either.dart';
import 'package:notification_app/core/errors/app_error.dart';
import 'package:notification_app/features/notifications/data/models/notifications_data_model.dart';
import 'package:notification_app/features/notifications/data/models/update_payload.dart';

abstract class NotificationRepository {
  Future<Either<AppError, NotificationsDataModel>> fetchNotifications(
      Uri apiUrl);
  Future<Either<AppError, bool>> updateNotificationStatus(
      UpdatePayloadModel updatePayloadModel);
}
