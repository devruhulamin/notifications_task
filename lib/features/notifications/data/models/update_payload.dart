class UpdatePayloadModel {
  List<int> notificationIds;
  String status;

  UpdatePayloadModel({
    required this.notificationIds,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      "notification_Ids": notificationIds,
      "status": status,
    };
  }
}
