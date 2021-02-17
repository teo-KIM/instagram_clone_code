import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_code/widgets/post.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.camera_fill),
            color: Colors.black,
          ),
          middle: Text(
            "instagram",
            style: TextStyle(fontFamily: "VeganStyle"),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  icon: ImageIcon(
                      AssetImage('assets/images/actionbar_camera.png'), color: Colors.black87,),
                  onPressed: () {}),
              IconButton(
                  icon: ImageIcon(
                      AssetImage('assets/images/actionbar_camera.png'), color: Colors.black87,),
                  onPressed: () {})
            ],
          )),
      body: ListView.builder(
        itemBuilder: feedListBuilder,
        itemCount: 40,
      ),
    );
  }

  Widget feedListBuilder(BuildContext context, int index) {
    return Post(index: index,);
  }
}

