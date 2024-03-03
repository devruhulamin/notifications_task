import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:notification_app/constant/api_url.dart';
import 'package:notification_app/constant/token.dart';
import 'package:notification_app/core/errors/app_error.dart';
import 'package:http/http.dart' as http;
import 'package:notification_app/features/notifications/data/models/notifications_data_model.dart';
import 'package:notification_app/features/notifications/data/models/update_payload.dart';

class NotificationsApiDataSource {
  Future<Either<AppError, NotificationsDataModel>> fetchNotifications(
      Uri apiUrl) async {
    try {
      final response = await http.get(apiUrl, headers: {
        'Authorization': 'Bearer $authToken',
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        final data = decodedResponse['data'];
        final notificationsData = NotificationsDataModel.fromJson(data);
        return Right(notificationsData);
      }
      return Left(AppError(
          message: 'Something went wrong while getting notifications data',
          statusCode: response.statusCode));
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }

  Future<Either<AppError, bool>> updateNotificationStatus(
      UpdatePayloadModel updatePayload) async {
    try {
      final response = await http.post(Uri.parse(updateNotificationsUrl),
          headers: {
            'Authorization': 'Bearer $authToken',
            'Content-Type': 'application/json',
          },
          body: jsonEncode(updatePayload.toJson()));
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body);
        if (decodedResponse["status"] == '200') {
          return const Right(true);
        }
      }
      return Left(AppError(
          message: 'Something went wrong while updating notifications data',
          statusCode: response.statusCode));
    } catch (e) {
      return Left(AppError(message: e.toString()));
    }
  }
}
