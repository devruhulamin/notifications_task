import 'package:notification_app/core/enums/update_status.dart';

extension GetUpdateMethod on UpdateStatus {
  String get getName {
    switch (this) {
      case UpdateStatus.read:
        return 'Read';
      case UpdateStatus.delete:
        return 'Delete';
      default:
        return '';
    }
  }
}

final value = UpdateStatus.delete.getName;
