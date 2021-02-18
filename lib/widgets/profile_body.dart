import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_code/constants/common_size.dart';
import 'package:instagram_clone_code/constants/screen_size.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  SelectedTab _selectedTab = SelectedTab.LEFT;
  double _leftImagesPageMargin = 0;
  double _rightImagesPageMargin = size.width;

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
            _tapButtons(),
            _selectedIndicator(),
          ])),
          _imagesPager()
        ],
      ),
    );
  }

  SliverToBoxAdapter _imagesPager() {
    return SliverToBoxAdapter(
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                transform: Matrix4.translationValues(_leftImagesPageMargin, 0, 0),
                child: _images(),
                curve: Curves.fastLinearToSlowEaseIn,
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                transform: Matrix4.translationValues(_rightImagesPageMargin, 0, 0),
                child: _images(),
                curve: Curves.fastLinearToSlowEaseIn,
              ),
            ],
          ),
        );
  }

  GridView _images() {
    return GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                  30,
                  (index) => CachedNetworkImage(
                      imageUrl: "https://picsum.photos/id/$index/100/100",
                  fit: BoxFit.cover,),
                ),
              );
  }

  Widget _selectedIndicator() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 1000),
      alignment: _selectedTab == SelectedTab.LEFT
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        height: 3,
        width: size.width / 2,
        color: Colors.black,
      ),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  Row _tapButtons() {
    return Row(
      children: [
        Expanded(
          child: IconButton(
              icon: ImageIcon(
                AssetImage('assets/images/grid.png'),
                color: _selectedTab == SelectedTab.LEFT
                    ? Colors.black
                    : Colors.black26,
              ),
              onPressed: () {
                _tabSelected(SelectedTab.LEFT);
              }),
        ),
        Expanded(
          child: IconButton(
              icon: ImageIcon(
                AssetImage('assets/images/saved.png'),
                color: _selectedTab == SelectedTab.RIGHT
                    ? Colors.black
                    : Colors.black26,
              ),
              onPressed: () {
                _tabSelected(SelectedTab.RIGHT);
              }),
        )
      ],
    );
  }

  void _tabSelected(SelectedTab selectedTab){
    switch(selectedTab){

      case SelectedTab.LEFT:
        setState(() {
          _selectedTab = SelectedTab.LEFT;
          _leftImagesPageMargin = 0;
          _rightImagesPageMargin = size.width;
        });
        break;
      case SelectedTab.RIGHT:
        setState(() {
          _selectedTab = SelectedTab.RIGHT;
          _leftImagesPageMargin = -size.width;
          _rightImagesPageMargin = 0;
        });
        break;
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
}



enum SelectedTab { LEFT, RIGHT }
