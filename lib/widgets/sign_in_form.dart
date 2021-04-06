import 'package:flutter/material.dart';
import 'package:instagram_clone_code/constants/auth_input_deco.dart';
import 'package:instagram_clone_code/constants/common_size.dart';
import 'package:instagram_clone_code/home_page.dart';

class SignInForm extends StatefulWidget {

  //form의 상태를 가지고 있는 key
  //현재 그 안에 어떤 데이터를 가지고있는지(Text)
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
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
              cursorColor: Colors.black,
              controller: _emailController,
              decoration: textInputDecor("Email"),
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
              cursorColor: Colors.black,
              obscureText: true,
              controller: _passwordController,
              decoration: textInputDecor("Password"),
              validator: (text) {
                if (text.isNotEmpty && text.length > 5) {
                  return null;
                } else {
                  return "비밀번호는 6자리 이상 등록해주세요.";
                }
              },
            ),
            SizedBox(
              height: common_s_gap,
            ),
            _submitButton(context),
            SizedBox(
              height: common_s_gap,
            ),
            _orDivider(),
            FlatButton.icon(
                onPressed: () {},
                textColor: Colors.blue,
                icon: ImageIcon(AssetImage('assets/images/facebook.png'),),
                label: Text("Login with Facebook"))
          ],
        ),
      ),
    );
  }

  TextButton _submitButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (_formKey.currentState.validate()) {
          //true값
          print('Validation success!!');
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()));
        } else {
          //false값
        }
      },
      child: Text(
        'Join',
        style: TextStyle(color: Colors.white),
      ),
      style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)))),
    );
  }

  Stack _orDivider() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Divider(
          thickness: 2,
          color: Colors.grey[300],
        ),
        Container(
          color: Colors.grey[50],
          width: 60,
          height: 3,
        ),
        Text(
          "OR",
          style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.bold,
              fontSize: 14),
        )
      ],
    );
  }
}