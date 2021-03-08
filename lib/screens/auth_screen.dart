import 'package:flutter/material.dart';
import 'package:instagram_clone_code/widgets/fade_stack.dart';
import 'package:instagram_clone_code/widgets/sign_in_form.dart';
import 'package:instagram_clone_code/widgets/sign_up_form.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  //0이면 signIn, 1이면 signUp
  int selectedForm = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FadeStack(
              selectedForm: selectedForm,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Divider(color: Colors.grey[300],thickness: 3,height: 0,),
                  Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          if (selectedForm == 0) {
                            selectedForm = 1;
                          } else {
                            selectedForm = 0;
                          }
                        });
                      },
                      child: RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: selectedForm == 0 ? "Don't have an account?" : "Already have an account?",
                              style: TextStyle(color: Colors.grey)),
                          TextSpan(
                              text: selectedForm == 0 ? " Sign Up" : " Sign In",
                              style: TextStyle(
                                  color: Colors.blue, fontWeight: FontWeight.bold)),
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
