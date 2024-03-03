import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app/features/notifications/data/models/notification_model.dart';
import 'package:notification_app/features/notifications/presentation/bloc/fetch_notification/notification_bloc.dart';
import 'package:notification_app/features/notifications/presentation/widgets/notification_item.dart';
import 'package:notification_app/features/notifications/presentation/widgets/notifications_list.dart';

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({
    super.key,
    required this.controller,
    required this.notifications,
    required this.widget,
    required this.pageSize,
  });

  final ScrollController controller;
  final List<NotificationsModel> notifications;
  final NotificationsList widget;
  final int pageSize;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      itemBuilder: (context, index) {
        if (index < notifications.length) {
          final notification = notifications[index];
          final isSelected =
              context.read<NotificationBloc>().isMarked(notification.id ?? 0);
          return NotificationItem(
            notificationsModel: notification,
            isSelectTed: isSelected,
            isShowMarks: widget.isShowMarks,
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: notifications.length < pageSize
                ? const Text("No More Notifications")
                : const CircularProgressIndicator(),
          ),
        );
      },
      itemCount: notifications.length + 1,
      separatorBuilder: (context, index) {
        return const Divider();
      },
    );
  }
}
