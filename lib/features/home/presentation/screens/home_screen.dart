import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_app/features/home/presentation/widgets/home_drawer.dart';
import 'package:notification_app/features/login/presentation/screens/login_screen.dart';
import 'package:notification_app/features/notifications/presentation/bloc/fetch_notification/notification_bloc.dart';
import 'package:notification_app/features/notifications/presentation/bloc/fetch_notification/notification_event.dart';
import 'package:notification_app/features/notifications/presentation/bloc/fetch_notification/notification_state.dart';
import 'package:notification_app/features/notifications/presentation/screens/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NotificationBloc>().add(FetchNotification());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        actions: [
          BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ErrorState) {
                return const Icon(
                  Icons.error,
                  color: Colors.red,
                );
              } else if (state is LoadedState) {
                return Stack(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const NotificationScreen(),
                          ));
                        },
                        icon: const Icon(
                          Icons.notifications_none_sharp,
                          size: 24,
                        )),
                    Positioned(
                        top: 4,
                        right: 4,
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 225, 66, 66),
                          maxRadius: 10,
                          child: Text(
                            '${state.notificationsDataModel.totalunread}',
                            style: const TextStyle(
                                fontSize: 10, color: Colors.white),
                          ),
                        ))
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ));
                },
                child: const Text("Login Task"))
          ],
        ),
      ),
    );
  }
}
