import 'package:flutter/material.dart';
import 'package:instagram_clone_code/constants/common_size.dart';
import 'package:instagram_clone_code/widgets/rounded_avatar.dart';

class Comment extends StatelessWidget {
  final bool showImage;
  final String username;
  final String text;
  final DateTime datetime;

  const Comment({
    Key key,
    this.showImage = true,
    @required this.username,
    this.text,
    this.datetime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showImage) RoundedAvatar(size: 24),
        if (showImage) SizedBox(width: common_xxs_gap),
        Column(
          children: [
            RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                text: username,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              TextSpan(text: ' '),
              TextSpan(text: text, style: TextStyle(color: Colors.black87))
            ])),
            if (datetime != null)
              Text(
                datetime.toIso8601String(),
                style: TextStyle(color: Colors.grey[400], fontSize: 10),
              )
          ],
        ),
      ],
    );
  }
}
