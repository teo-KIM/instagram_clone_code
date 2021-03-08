import 'package:flutter/material.dart';
import 'package:instagram_clone_code/constants/common_size.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  //form의 상태를 가지고 있는 key
  //현재 그 안에 어떤 데이터를 가지고있는지(Text)
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          SizedBox(width: common_l_gap,),
          Image.asset('assets/images/insta_text_logo.png'),
          TextFormField(

          ),
          TextFormField(

          ),
          TextFormField(

          ),
        ],
      ),);
  }
}
