import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app/features/notifications/presentation/bloc/fetch_notification/notification_bloc.dart';
import 'package:notification_app/features/notifications/presentation/bloc/fetch_notification/notification_event.dart';
import 'package:notification_app/features/notifications/presentation/bloc/fetch_notification/notification_state.dart';
import 'package:notification_app/features/notifications/presentation/widgets/notifications_list_view.dart';

class NotificationsList extends StatefulWidget {
  final bool isShowMarks;
  const NotificationsList({
    super.key,
    required this.isShowMarks,
  });

  @override
  State<NotificationsList> createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  final controller = ScrollController();
  int pageSize = 10;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        pageSize = pageSize + 10;
        context
            .read<NotificationBloc>()
            .add(FetchNotificationWithPage(page: 1, pageSize: pageSize));
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
        bloc: context.read<NotificationBloc>(),
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is LoadedState) {
            final notifications = state.notificationsDataModel.results ?? [];
            return NotificationsListView(
                controller: controller,
                notifications: notifications,
                widget: widget,
                pageSize: pageSize);
          } else if (state is ErrorState) {
            return Center(
              child: Text(
                "${state.message} || StatusCode: ${state.statusCode}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return const SizedBox();
        });
  }
}
