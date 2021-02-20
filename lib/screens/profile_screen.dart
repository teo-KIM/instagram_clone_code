import 'package:flutter/material.dart';
import 'package:instagram_clone_code/constants/common_size.dart';
import 'package:instagram_clone_code/constants/screen_size.dart';
import 'package:instagram_clone_code/widgets/profile_body.dart';

class ProfileScreen extends StatefulWidget {


  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final duration = Duration(milliseconds: 300);
  final menuWidth = size.width/2;

  MenuStatus _menuStatus = MenuStatus.CLOSED;

  double bodyXPos = 0;

  double menuXPos = size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          //body
          AnimatedContainer(
            transform: Matrix4.translationValues(bodyXPos, 0, 0),
            child: ProfileBody(
              onMenuChanged: (){
                setState(() {
                  _menuStatus = (_menuStatus == MenuStatus.CLOSED) ? MenuStatus.OPENED : MenuStatus.CLOSED;

                  switch(_menuStatus){
                    case MenuStatus.OPENED:
                      bodyXPos = -menuWidth;
                      menuXPos = menuWidth;
                      break;
                    case MenuStatus.CLOSED:
                      bodyXPos = 0;
                      menuXPos = size.width;
                      break;
                  }
                });
              }
            ),
            duration: duration,
            curve: Curves.fastOutSlowIn,
          ),
          //메뉴
          AnimatedContainer(
            transform: Matrix4.translationValues(menuXPos, 0, 0),
            duration: duration,
            curve: Curves.fastOutSlowIn,
            child: Positioned(
                top: 0,
                bottom: 0,
                width: size.width / 2,
                child: Container(
                  color: Colors.purpleAccent,
                )),
          )
        ],
      ),
    );
  }
}

enum MenuStatus{OPENED, CLOSED}