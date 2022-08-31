

import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sokh/signin_login/custom_text_form_field.dart';
import 'package:sokh/signin_login/login.dart';


class SignIN extends StatefulWidget {
  const SignIN({Key? key}) : super(key: key);

  @override
  State<SignIN> createState() => _SignINState();
}

  FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  GlobalKey<FormState> _signinKey= GlobalKey<FormState>();
  TextEditingController signinEmailController=TextEditingController();
  TextEditingController signinPassController=TextEditingController();
  TextEditingController signinConfirmPassController=TextEditingController();


class _SignINState extends State<SignIN> {
  @override
  Widget build(BuildContext context) {

    double dynamicHeight=MediaQuery.of(context).size.height;
    double dynamicWidth=MediaQuery.of(context).size.width;


    return
      Scaffold(
      body: Form(
        key:_signinKey ,
        child: Column(
          children: [

            /// (child-1) Page title SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
            Padding(
              padding: const EdgeInsets.only(top:50 ,bottom: 0,right: 0,left:0 ),
              child: Text("SIGNIN",style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize:35
              ),),
            ),
            /// (child-1) Page title EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

            SizedBox(
              height: 50,
            ),



            /// (child-1) Email field start SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
            CustomTextField(
                textController: signinEmailController,
                ErrorMsg: "This field can't be empty",
                HintText: "Enter your email",
                LabelText:  "Email",
                fieldIcon: Icons.email_rounded ),

            /// (child-1)Email field end EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

            ///(child-1)Password field start  SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
            CustomTextField(
                textController: signinPassController,
                ErrorMsg: "This field can't be empty",
                HintText: "Enter your password",
                LabelText:  "Password",
                fieldIcon: Icons.remove_red_eye_rounded ),

            ///(child-1)Password field end  EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

            ///Confirm password field start  SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
            CustomTextField(
                textController: signinConfirmPassController,
                ErrorMsg: "This field can't be empty",
                HintText: "Retype your password",
                LabelText:  "Confirm password",
                fieldIcon: Icons.remove_red_eye_rounded ),

            ///Confirm password field end  EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

            ///(child-1) Signin button start SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
            Padding(
              padding: const EdgeInsets.only(left: 0,right:0 ,top: 2,bottom:0 ),
              child: Container(
                height: dynamicHeight*0.06,
                width: dynamicWidth*0.4,


                child: ElevatedButton(

                    onPressed:() {
                       if(_signinKey.currentState!.validate())
                         {
                           fireBaseSignin(signinEmailController.text,signinPassController.text,context);
                         }
                    },
                    child: Text("SIGNIN")),
              ),
            ),

                       ///(child-1) Signin button end EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE



            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  ///  (child-1) Asking if the user have an existing account  SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
                  Text("Have an account?",style: TextStyle(
                    color: Colors.deepOrangeAccent,),
                  ),
                  ///  (child-1) Asking if the user have an existing account  EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE


                      ///(child-2) Goto login page if have an account  SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
                  InkWell(
                      onTap: (){
                        Navigator.pop(context,MaterialPageRoute(builder: (context)=>LogIN()));

                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color: Colors.deepOrangeAccent,
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("LOGIN"),
                          )
                      )
                  ),

                  ///(child-2) Goto login page if have an account  EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE


                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

  fireBaseSignin(String email,String password,BuildContext context)async {

  await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((value){

    Fluttertoast.showToast(msg: "Login successful");
    loginEmailController.text=signinEmailController.text;
    loginPassController.text=signinPassController.text;
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIN()));
  }).catchError((error) {
    Fluttertoast.showToast(msg: "there is a problem");
  });
  }