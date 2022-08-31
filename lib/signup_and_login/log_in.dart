

import 'package:flutter/material.dart';
import 'package:sokh/signup_and_login/custom_text_field.dart';
import 'package:sokh/signup_and_login/sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}



class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:CustomAccountPage(

          actionName: "Login",
          emailErrorMsg: "This field can't be empty",
          emailHintText: "Enter your email",
          emailLabelText: "Email",
          passwordErrorMsg: "This field can't be empty",
          passwordHintText: "Enter your password",
          passwodLabelText:"Password",
          checkForAccount: "Don't have an account?",
          signupLoginOption: "Signup",
          signUpExtra: 0,
          Goto: Signin(),
          )
    );
  }
}
