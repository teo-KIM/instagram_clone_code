import 'package:flutter/material.dart';
import 'package:instagram_clone_code/constants/common_size.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate(
                  <Widget>[_username(), _userbio(), _editProfileBtn()]))
        ],
      ),
    );
  }
}

Padding _editProfileBtn() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: common_gap),
    child: SizedBox(
      height: 24,
      child: OutlinedButton(
        onPressed: () {},
        child: Text(
          'Edit profile',
          style:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.black45),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6))),
      ),
    ),
  );
}

Widget _userbio() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: common_gap),
    child: Text(
      'operation cwal',
      style: TextStyle(fontWeight: FontWeight.w400),
    ),
  );
}

Widget _username() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: common_gap),
    child: Text(
      'username',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
}