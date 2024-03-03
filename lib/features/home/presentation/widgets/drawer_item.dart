import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(80), bottomRight: Radius.circular(20)),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        color: Colors.black,
        child: UnconstrainedBox(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 76, 17),
                borderRadius: BorderRadius.circular(10)),
            child: const Column(
              children: [Icon(Icons.dashboard), Text("Table")],
            ),
          ),
        ),
      ),
    );
  }
}
