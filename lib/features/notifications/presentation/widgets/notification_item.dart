import 'package:flutter/material.dart';
import 'package:notification_app/core/utility/formate_str_date.dart';
import 'package:notification_app/features/notifications/data/models/notification_model.dart';
import 'package:notification_app/features/notifications/presentation/widgets/notifications_check_box.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem(
      {super.key,
      required this.notificationsModel,
      required this.isShowMarks,
      required this.isSelectTed});
  final bool isSelectTed;
  final bool isShowMarks;

  final NotificationsModel notificationsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Visibility(
            replacement: const SizedBox(),
            visible: isShowMarks,
            child: NotifcationCheckBox(
              key: UniqueKey(),
              id: notificationsModel.id ?? 0,
              isSelected: isSelectTed,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      if (notificationsModel.readStatus == 'Yes')
                        const CircleAvatar(
                          maxRadius: 4,
                          backgroundColor: Color.fromARGB(255, 225, 66, 66),
                        ),
                      Text(
                        "${notificationsModel.title}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 225, 66, 66)),
                      ),
                    ]),
                    Text(
                      formatDateString(notificationsModel.createdAt ?? ''),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 225, 66, 66)),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "${notificationsModel.description}",
                  maxLines: 5,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
