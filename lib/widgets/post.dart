import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_code/constants/common_size.dart';
import 'package:instagram_clone_code/widgets/my_progress_indicator.dart';

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
      children: [
        _postHeader(),
        _postImage(),
      ],
    );
  }

  Widget _postHeader() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(common_xxs_gap),
          child: ClipOval(
              child: CachedNetworkImage(
            imageUrl: 'https://picsum.photos/100',
            width: avatar_size,
            height: avatar_size,
          )),
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
