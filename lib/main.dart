import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app/features/home/presentation/screens/home_screen.dart';
import 'package:notification_app/features/notifications/data/data_sources/notifications_api_data_source.dart';
import 'package:notification_app/features/notifications/data/repository/notifications_repository_impl.dart';
import 'package:notification_app/features/notifications/presentation/bloc/fetch_notification/notification_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final notificationProver = NotificationRepositoryImpl(
            notificationsApiDataSource: NotificationsApiDataSource());
        final bloc = NotificationBloc(notificationProver);
        return bloc;
      },
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xFFE57373),
        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
