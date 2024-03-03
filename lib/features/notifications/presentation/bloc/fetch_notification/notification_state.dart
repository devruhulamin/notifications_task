import 'package:equatable/equatable.dart';
import 'package:notification_app/features/notifications/data/models/notifications_data_model.dart';

abstract class NotificationState extends Equatable {}

class InitialState extends NotificationState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends NotificationState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends NotificationState {
  final NotificationsDataModel notificationsDataModel;
  final List<int>? selectedNotifications;
  final bool? checking;

  LoadedState(
      {required this.notificationsDataModel,
      this.selectedNotifications,
      this.checking});

  @override
  List<Object?> get props =>
      [notificationsDataModel, selectedNotifications, checking];
}

class NotificationSelected extends NotificationState {
  final bool isSelected;

  NotificationSelected({required this.isSelected});

  @override
  List<Object?> get props => [isSelected];
}

class ErrorState extends NotificationState {
  final String? message;
  final int? statusCode;

  ErrorState(this.message, this.statusCode);

  @override
  List<Object?> get props => [message, statusCode];
}
