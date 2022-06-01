import 'package:baby_tracker/view/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
//close the drawer
Get.back();
Get.to(()=>SettingsView());
              },
            ),
            ListTile(
              title: const Text('BB'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
  }
}