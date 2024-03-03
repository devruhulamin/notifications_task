import 'package:flutter/material.dart';
import 'package:notification_app/features/home/presentation/widgets/drawer_item.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        width: 100,
        height: double.infinity,
        color: Colors.white,
        child: const Column(
          children: [
            DrawerItem(),
            SizedBox(
              height: 8,
            ),
            DrawerItem(),
          ],
        ),
      ),
    );
  }
}
