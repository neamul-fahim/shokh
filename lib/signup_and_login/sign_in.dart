

import 'package:flutter/material.dart';
import 'package:sokh/signup_and_login/log_in.dart';
import 'package:sokh/signup_and_login/custom_text_field.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}



class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {

    double dynamicHeight=MediaQuery.of(context).size.height;
    double dynamicWidth=MediaQuery.of(context).size.width;




    return Scaffold(
        body:CustomAccountPage(

          actionName: "Signin",
          emailErrorMsg: "This field can't be empty",
          emailHintText: "Enter your email",
          emailLabelText: "Email",
          passwordErrorMsg: "This field can't be empty",
          passwordHintText: "Enter your password",
          passwodLabelText:"Password",
          checkForAccount: "Have an account?",
          signupLoginOption: "Login",
          signUpExtra: 1,
          Goto: Login(),
        )
    );
  }
}
