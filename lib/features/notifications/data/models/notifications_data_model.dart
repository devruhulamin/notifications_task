import 'package:equatable/equatable.dart';
import 'package:notification_app/features/notifications/data/models/notification_model.dart';

class NotificationsDataModel extends Equatable {
  int? totalunread;
  List<NotificationsModel>? results;

  NotificationsDataModel({this.totalunread, this.results});

  NotificationsDataModel.fromJson(Map<String, dynamic> json) {
    totalunread = json['totalunread'];
    if (json['results'] != null) {
      results = <NotificationsModel>[];
      json['results'].forEach((v) {
        results!.add(NotificationsModel.fromJson(v));
      });
    }
  }

  @override
  List<Object?> get props => [totalunread, results];
}
