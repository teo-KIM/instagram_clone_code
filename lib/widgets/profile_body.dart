import 'package:flutter/material.dart';
import 'package:instagram_clone_code/constants/common_size.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  bool selectedLeft = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            _username(),
            _userbio(),
            _editProfileBtn(),
            Row(
              children: [
                Expanded(
                  child: IconButton(
                      icon: ImageIcon(
                        AssetImage('assets/images/grid.png'),
                        color: selectedLeft ? Colors.black : Colors.black26,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedLeft = true;
                        });
                      }),
                ),
                Expanded(
                  child: IconButton(
                      icon: ImageIcon(
                        AssetImage('assets/images/saved.png'),
                        color: !selectedLeft ? Colors.black : Colors.black26,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedLeft = false;
                        });
                      }),
                )
              ],
            )
          ]))
        ],
      ),
    );
  }
}

Padding _editProfileBtn() {
  return Padding(
    padding:
        EdgeInsets.symmetric(horizontal: common_gap, vertical: common_xxs_gap),
    child: SizedBox(
      height: 24,
      child: OutlinedButton(
        onPressed: () {},
        child: Text(
          'Edit profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.black45),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
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
