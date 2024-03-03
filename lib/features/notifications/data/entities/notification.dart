abstract class NotificationEntity {
  int? id;
  int? userId;
  String? image;
  String? title;
  String? description;
  String? readStatus;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  NotificationEntity(
      {this.id,
      this.userId,
      this.image,
      this.title,
      this.description,
      this.readStatus,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          userId == other.userId &&
          image == other.image &&
          title == other.title &&
          description == other.description &&
          readStatus == other.readStatus &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          deletedAt == other.deletedAt;

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      image.hashCode ^
      title.hashCode ^
      description.hashCode ^
      readStatus.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      deletedAt.hashCode;
}
