import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app/core/enums/update_status.dart';
import 'package:notification_app/features/notifications/presentation/bloc/fetch_notification/notification_bloc.dart';
import 'package:notification_app/features/notifications/presentation/bloc/fetch_notification/notification_event.dart';
import 'package:notification_app/features/notifications/presentation/widgets/notifications_list.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool shouldMark = false;
  bool isAllSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        actions: [
          IconButton(
              onPressed: () {
                shouldMark = !shouldMark;
                setState(() {});
              },
              icon: shouldMark
                  ? const Icon(
                      Icons.edit,
                      color: Colors.blue,
                    )
                  : const Icon(Icons.edit))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: NotificationsList(
              isShowMarks: shouldMark,
            ),
          ),
          if (shouldMark)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isAllSelected,
                        onChanged: (value) {
                          isAllSelected = value ?? false;
                          if (value ?? false) {
                            context
                                .read<NotificationBloc>()
                                .add(SelectAllNotifications(
                                  true,
                                ));
                          } else {
                            context
                                .read<NotificationBloc>()
                                .add(SelectAllNotifications(false));
                          }
                          setState(() {});
                        },
                      ),
                      const Text('All'),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            context.read<NotificationBloc>().add(
                                UpdateNotificaton(status: UpdateStatus.delete));
                          },
                          child: const Text('Delete')),
                      const SizedBox(
                        width: 8,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context.read<NotificationBloc>().add(
                                UpdateNotificaton(status: UpdateStatus.read));
                          },
                          child: const Text('Marks as read')),
                    ],
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}
