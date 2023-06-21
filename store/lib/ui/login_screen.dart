import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/const/AppColors.dart';
import 'package:store/ui/bottom_nav_controller.dart';
import 'package:store/ui/registration_screen.dart';
import 'package:store/widgets/customButton.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  signIn()async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );
      var authCredential = userCredential.user;
      print(authCredential!.uid);
      if(authCredential.uid.isNotEmpty){
        Navigator.push(context, CupertinoPageRoute(builder: (_)=>BottomNavController()));
      }
      else{
        Fluttertoast.showToast(msg: "Something is wrong");
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: "Нет пользователя с таким email.");

      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Неверный пароль для указанной почты.");

      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 150.h,
              width: ScreenUtil().screenWidth,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: null,
                      icon: Icon(
                        Icons.light,
                        color: Colors.transparent,
                      ),
                    ),
                    Text(
                      "Вход",
                      style: TextStyle(fontSize: 22.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          "Добро пожаловать!",
                          style: TextStyle(
                              fontSize: 22.sp, color: Colors.deepPurpleAccent),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: TextField(
                                style: TextStyle(color: Colors.black),
                                controller: _emailController,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xFFBBBBBB),
                                  ),
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: TextField(
                                style: TextStyle(color: Colors.black),
                                controller: _passwordController,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  hintText: "6-значный пароль",
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: Color(0xFFBBBBBB),
                                  ),
                                  labelText: 'Пароль',
                                  labelStyle: TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.deepPurpleAccent,
                                  ),
                                  suffixIcon: _obscureText == true
                                      ? IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = false;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.remove_red_eye,
                                            size: 20.w,
                                          ))
                                      : IconButton(
                                          onPressed: () {
                                            setState(() {
                                              _obscureText = true;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.visibility_off,
                                            size: 20.w,
                                          )),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 50.h,
                        ),
                        // elevated button
                        customButton("Войти", (){
                          signIn();
                        },),
                        SizedBox(
                          height: 20.h,
                        ),
                        Wrap(
                          children: [
                            Text(
                              "Нет аккаунта?",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFBBBBBB),
                              ),
                            ),
                            GestureDetector(
                              child: Text(
                                " Зарегистрироваться",
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.deepPurpleAccent,
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            RegistrationScreen()));
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
