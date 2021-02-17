import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_code/constants/common_size.dart';
import 'package:instagram_clone_code/widgets/comment.dart';
import 'package:instagram_clone_code/widgets/my_progress_indicator.dart';
import 'package:instagram_clone_code/widgets/rounded_avatar.dart';

class Post extends StatelessWidget {
  final int index;
  Size _size;

  Post({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postHeader(),
        _postImage(),
        _postActions(),
        _postLikes(),
        _postCaption()
      ],
    );
  }

  Widget _postCaption() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: common_xxs_gap, horizontal: common_xxs_gap),
      child: Comment(
        showImage: false,
        username: 'testUser',
        text: "show me the money",
      ),
    );
  }

  Padding _postLikes() {
    return Padding(
      padding: const EdgeInsets.only(left: common_gap),
      child: Text(
        "12000 likes",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Row _postActions() {
    return Row(
      children: [
        IconButton(
          icon: Image.asset(
            'assets/images/bookmark.png',
            width: avatar_size,
          ),
          onPressed: null,
          color: Colors.black87,
        ),
        IconButton(
          icon: Image.asset('assets/images/comment.png', width: avatar_size),
          onPressed: null,
          color: Colors.black87,
        ),
        IconButton(
          icon: Image.asset('assets/images/direct_message.png',
              width: avatar_size),
          onPressed: null,
          color: Colors.black87,
        ),
        Spacer(),
        IconButton(
          icon: Image.asset('assets/images/heart_selected.png',
              width: avatar_size),
          onPressed: null,
          color: Colors.black87,
        ),
      ],
    );
  }

  Widget _postHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(common_xxs_gap),
          child: RoundedAvatar(),
        ),
        Expanded(child: Text('username')),
        IconButton(icon: Icon(Icons.more_horiz), onPressed: null)
      ],
    );
  }

  CachedNetworkImage _postImage() {
    return CachedNetworkImage(
      imageUrl: "https://picsum.photos/id/$index/200/200",
      placeholder: (
        BuildContext context,
        String url,
      ) {
        return MyProgressIndicator(
          containerSize: _size.width,
        );
      },
      imageBuilder: (BuildContext context, ImageProvider imageProvider) {
        return AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: imageProvider, fit: BoxFit.cover)),
          ),
        );
      },
    );
  }
}
