import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_code/constants/common_size.dart';
import 'package:instagram_clone_code/constants/screen_size.dart';
import 'package:instagram_clone_code/screens/profile_screen.dart';
import 'package:instagram_clone_code/widgets/rounded_avatar.dart';

class ProfileBody extends StatefulWidget {

  final Function() onMenuChanged;

  const ProfileBody({Key key, this.onMenuChanged}) : super(key: key);

  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> with SingleTickerProviderStateMixin{
  SelectedTab _selectedTab = SelectedTab.LEFT;
  double _leftImagesPageMargin = 0;
  double _rightImagesPageMargin = size.width;

  AnimationController _iconAnimationController;

  @override
  void initState() {
    _iconAnimationController = AnimationController(vsync: this, duration: duration);
    super.initState();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _appbar(),
          Expanded(
            child: CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate(<Widget>[
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(common_gap),
                          child: RoundedAvatar(
                            size: 80,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: common_gap),
                            child: Table(
                              children: [
                                TableRow(children: [
                                  _valueText("141414"),
                                  _valueText("2983"),
                                  _valueText("1094"),
                                ]),
                                TableRow(children: [
                                  _labelText("Post"),
                                  _labelText("Followers"),
                                  _labelText("Following")
                                ])
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    _username(),
                    _userbio(),
                    _editProfileBtn(),
                    _tapButtons(),
                    _selectedIndicator(),
                  ])),
                  _imagesPager()
                ],
              ),
          ),
        ],
      ),
    );
    // );
  }

  Text _valueText(String value) => Text(
        value,
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      );

  Text _labelText(String label) => Text(
        label,
        style: TextStyle(fontWeight: FontWeight.w300),
        textAlign: TextAlign.center,
      );

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
          fit: BoxFit.cover,
        ),
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

  void _tabSelected(SelectedTab selectedTab) {
    switch (selectedTab) {
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
      padding: EdgeInsets.symmetric(
          horizontal: common_gap, vertical: common_xxs_gap),
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

  Row _appbar() {
    return Row(
      children: [
        SizedBox(
          width: 44,
        ),
        Expanded(
            child: Text(
              "the coding papa",
              textAlign: TextAlign.center,
            )),
        IconButton(icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _iconAnimationController
        ), onPressed: () {
          widget.onMenuChanged();
          _iconAnimationController.status==AnimationStatus.completed ? _iconAnimationController.reverse() : _iconAnimationController.forward();
        })
      ],
    );
  }

}




enum SelectedTab { LEFT, RIGHT }
