import 'package:flutter/material.dart';

class ProfileSideMenu extends StatelessWidget {
  final double menuWidth;

  const ProfileSideMenu(this.menuWidth, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: menuWidth,
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.black87,
              ),
              title: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}