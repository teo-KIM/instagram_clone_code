import 'package:flutter/material.dart';


class Post extends StatelessWidget {
  final int index;
  const Post({
    Key key, this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.accents[index % Colors.accents.length],
    );
  }
}