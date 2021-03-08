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

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    //dispose 되는 경우 controller도 무조건 dispose 시켜줄것.
    //해당 controller가 메모리를 계속 잡고있는다 => memory leak
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(common_gap),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(
              width: common_l_gap,
            ),
            Image.asset('assets/images/insta_text_logo.png'),
            TextFormField(
              controller: _emailController,
              decoration: _textInputDecor("Email"),
              validator: (text) {
                if (text.isNotEmpty && text.contains("@")) {
                  return null;
                } else {
                  return "정확한 이메일 주소를 입력해주세요.";
                }
              },
            ),
            SizedBox(
              height: common_xs_gap,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: _textInputDecor("Password"),
              validator: (text) {
                if (text.isNotEmpty && text.length > 5) {
                  return null;
                } else {
                  return "이메일은 5자리 이상 준비해주세요.";
                }
              },
            ),
            SizedBox(
              height: common_xs_gap,
            ),
            TextFormField(
              controller: _confirmPasswordController,
              decoration: _textInputDecor("Confirm Password"),
              validator: (text) {
                if (text.isNotEmpty && _passwordController.text == text) {
                  return null;
                } else {
                  return "비밀번호가 일치하지 않습니다.";
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _textInputDecor(String hint) {
    return InputDecoration(
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[300],
        ),
        borderRadius: BorderRadius.circular(common_s_gap),
      ),
      filled: true,
      fillColor: Colors.grey[100],
    );
  }
}
