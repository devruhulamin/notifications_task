import 'package:either_dart/either.dart';
import 'package:notification_app/core/errors/app_error.dart';
import 'package:notification_app/features/notifications/data/data_sources/notifications_api_data_source.dart';
import 'package:notification_app/features/notifications/data/models/notifications_data_model.dart';
import 'package:notification_app/features/notifications/data/models/update_payload.dart';
import 'package:notification_app/features/notifications/data/repository/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationsApiDataSource notificationsApiDataSource;

  NotificationRepositoryImpl({required this.notificationsApiDataSource});
  @override
  Future<Either<AppError, NotificationsDataModel>> fetchNotifications(
      Uri apiUrl) async {
    return await notificationsApiDataSource.fetchNotifications(apiUrl);
  }

  @override
  Future<Either<AppError, bool>> updateNotificationStatus(
      UpdatePayloadModel updatePayloadModel) async {
    return notificationsApiDataSource
        .updateNotificationStatus(updatePayloadModel);
  }
}
