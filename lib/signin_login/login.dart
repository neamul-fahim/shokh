

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sokh/signin_login/custom_text_form_field.dart';
import 'package:sokh/signin_login/signin.dart';

import '../my_home_page/my_home_page.dart';


class LogIN extends StatefulWidget {
  const LogIN({Key? key}) : super(key: key);

  @override
  State<LogIN> createState() => _LogINState();
}

   FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  GlobalKey<FormState> _loginKey=GlobalKey<FormState>();
  TextEditingController loginEmailController=TextEditingController();
  TextEditingController loginPassController=TextEditingController();



class _LogINState extends State<LogIN> {
  @override
  Widget build(BuildContext context) {

    double dynamicHeight=MediaQuery.of(context).size.height;
    double dynamicWidth=MediaQuery.of(context).size.width;


    return Scaffold(
      body: Form(
        key: _loginKey,
        child: Column(
          children: [

                  /// Page title SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
            Padding(
              padding: const EdgeInsets.only(top:50 ,bottom: 0,right: 0,left:0 ),
              child: Text("LOGIN",style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize:35
              ),),
            ),
               /// Page title EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

            SizedBox(
              height: 50,
            ),


            ///Email field start SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
            CustomTextField(
                textController: loginEmailController,
                ErrorMsg: "This field can't be empty",
                HintText: "Enter your email",
                LabelText:  "Email",
                fieldIcon: Icons.email_rounded ),

            ///Email field end EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE


            ///Password field start  SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
            CustomTextField(
                textController: loginPassController,
                ErrorMsg: "This field can't be empty",
                HintText: "Enter your password",
                LabelText:  "Password",
                fieldIcon: Icons.remove_red_eye_rounded ),

            ///Password field end  EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE



            ///Signin button start SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
            Padding(
              padding: const EdgeInsets.only(left: 0,right:0 ,top: 2,bottom:0 ),
              child: Container(
                height: dynamicHeight*0.06,
                width: dynamicWidth*0.4,


                child: ElevatedButton(

                    onPressed:() {
                      if(_loginKey.currentState!.validate()){
                        fireBaseLogin(loginEmailController.text, loginPassController.text, context);
                      }
                    },
                    child: Text("LOGIN")),
              ),
            ),

            ///Signin button end EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  ///  (child-1) Asking if the user have an existing account  SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
                  Text("Don't have an account?",style: TextStyle(
                    color: Colors.deepOrangeAccent,),
                  ),
                  ///  (child-1) Asking if the user have an existing account  EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE


                  ///(child-2) Goto signin page if don't have an account  SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS

                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIN()));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10),
                            color: Colors.deepOrangeAccent,
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("SIGNIN"),
                          )
                      )
                  ),
                  ///(child-2) Goto signin page if don't have an account  EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE


                ],
              ),
            ),

          ],
        ),
      ),
    );

  }
}

    void fireBaseLogin(String email,String password,BuildContext context)async{
  if(_loginKey.currentState!.validate())
  {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password).then((value) {
      Fluttertoast.showToast(msg: 'Login successful');
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));

    }).catchError((error){
      Fluttertoast.showToast(msg: "Login error");
    });

  }
}
