import 'package:flutter/material.dart';
import 'package:instagram_clone_code/widgets/sign_in_form.dart';
import 'package:instagram_clone_code/widgets/sign_up_form.dart';

class FadeStack extends StatefulWidget {
  final int selectedForm;

  const FadeStack({Key key, this.selectedForm}) : super(key: key);

  @override
  _FadeStackState createState() => _FadeStackState();
}

class _FadeStackState extends State<FadeStack>
    with SingleTickerProviderStateMixin {
  List<Widget> forms = [SignInForm(), SignUpForm()];

  //FadeTransition을 사용하기 위함
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    //처음에 forward를 한번 해줘야 적용됨
    _animationController.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FadeStack oldWidget) {
    //oldWidget을 사용해서 이전 이전 위젯과 현재 위젯을 비교함
    //widget.selectedForm = 최상단 Widget에 있는 변수를 사용할 때 widget.으로 사용한다
    if (widget.selectedForm != oldWidget.selectedForm) {
      _animationController.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: IndexedStack(
        index: widget.selectedForm,
        children: forms,
      ),
    );
  }
}
