import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app/constant/api_url.dart';
import 'package:notification_app/features/notifications/data/models/notifications_data_model.dart';
import 'package:notification_app/features/notifications/data/models/update_payload.dart';
import 'package:notification_app/features/notifications/data/repository/notifications_repository_impl.dart';
import 'package:notification_app/features/notifications/presentation/bloc/fetch_notification/notification_event.dart';
import 'package:notification_app/features/notifications/presentation/bloc/fetch_notification/notification_state.dart';
import 'package:notification_app/core/extensions/update_enum_to_string.dart';

class NotificationBloc extends Bloc<NotificationsEvent, NotificationState> {
  List<int> _selectedNotifications = [];
  NotificationsDataModel _loadedData = NotificationsDataModel();

  final NotificationRepositoryImpl notificationRepositoryImpl;
  NotificationBloc(this.notificationRepositoryImpl) : super(InitialState()) {
    on<FetchNotification>((event, emit) async {
      emit(LoadingState());
      const fetchUrl = '$getNotificationUrl?page=${1}&pageSize=${10}';
      final results = await notificationRepositoryImpl
          .fetchNotifications(Uri.parse(fetchUrl));
      if (results.isLeft) {
        emit(ErrorState(results.left.message, results.left.statusCode));
      } else if (results.isRight) {
        _loadedData = results.right;
        emit(LoadedState(
          notificationsDataModel: results.right,
          selectedNotifications: _selectedNotifications,
        ));
      }
    });
    on<FetchNotificationWithPage>((event, emit) async {
      final fetchUrl =
          '$getNotificationUrl?page=${event.page}&pageSize=${event.pageSize}';
      final results = await notificationRepositoryImpl
          .fetchNotifications(Uri.parse(fetchUrl));
      if (results.isLeft) {
        emit(ErrorState(results.left.message, results.left.statusCode));
      } else if (results.isRight) {
        _loadedData = results.right;
        emit(LoadedState(
            notificationsDataModel: results.right,
            selectedNotifications: _selectedNotifications));
      }
    });
    on<SelectAllNotifications>((event, emit) {
      _selectedNotifications.clear();
      if (event.isSelect) {
        final ids = _loadedData.results?.map((e) => e.id ?? 0) ?? [];
        _selectedNotifications.addAll(ids);
      }
      final newdata = NotificationsDataModel(
          results: _loadedData.results, totalunread: _loadedData.totalunread);
      final selectedPage = [..._selectedNotifications];
      emit(LoadedState(
          notificationsDataModel: newdata,
          selectedNotifications: selectedPage));
    });
    on<ToggleNotificationSelection>((event, emit) {
      final notificationId = event.notificationId;
      if (_selectedNotifications.contains(notificationId)) {
        _selectedNotifications.remove(notificationId);
      } else {
        _selectedNotifications.add(notificationId);
      }
    });
    on<UpdateNotificaton>(
      (event, emit) async {
        emit(LoadingState());
        final updateMethod = event.status.getName;
        final payload = UpdatePayloadModel(
            status: updateMethod, notificationIds: _selectedNotifications);
        final results =
            await notificationRepositoryImpl.updateNotificationStatus(payload);
        if (results.isLeft) {
          emit(ErrorState(results.left.message, results.left.statusCode));
        }
        _selectedNotifications = [];
        if (results.isRight) {
          add(FetchNotification());
        }
      },
    );
  }
  bool isMarked(int id) {
    return _selectedNotifications.contains(id);
  }
}
