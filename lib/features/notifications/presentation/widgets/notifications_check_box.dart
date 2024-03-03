import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app/features/notifications/presentation/bloc/fetch_notification/notification_bloc.dart';
import 'package:notification_app/features/notifications/presentation/bloc/fetch_notification/notification_event.dart';

class NotifcationCheckBox extends StatefulWidget {
  final int id;
  final bool isSelected;
  const NotifcationCheckBox(
      {super.key, required this.id, required this.isSelected});

  @override
  State<NotifcationCheckBox> createState() => _NotifcationCheckBoxState();
}

class _NotifcationCheckBoxState extends State<NotifcationCheckBox> {
  bool isChecked = false;
  @override
  void initState() {
    isChecked = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: isChecked,
        onChanged: (value) {
          isChecked = value ?? false;
          context
              .read<NotificationBloc>()
              .add(ToggleNotificationSelection(notificationId: widget.id));
          setState(() {});
        });
  }
}
