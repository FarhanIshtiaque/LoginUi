import 'package:codecany1/auth/authentification.dart';
import 'package:codecany1/screens/dashboard/dashboard.dart';
import 'package:codecany1/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController passwordControllerc = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * .03, left: width * .8),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(55, 44, 113, 1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * .6),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(101, 80, 193, 1.0),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(
              height: height * .08,
            ),
            Text(
              'Lets start the journey',
              style: GoogleFonts.pacifico(
                color: Colors.black,
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: height * .10,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(215, 215, 215, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(215, 215, 215, 1)),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 30),
                      suffixIcon: Icon(
                        Icons.email_outlined,
                        color: Color.fromRGBO(215, 215, 215, 1),
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(215, 215, 215, 1),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(215, 215, 215, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(215, 215, 215, 1)),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 30),
                      suffixIcon: Icon(
                        Icons.lock_outline,
                        color: Color.fromRGBO(215, 215, 215, 1),
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(215, 215, 215, 1),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: passwordControllerc,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(215, 215, 215, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(215, 215, 215, 1)),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 30),
                      suffixIcon: Icon(
                        Icons.lock_outline,
                        color: Color.fromRGBO(215, 215, 215, 1),
                      ),
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(215, 215, 215, 1),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * .05,
            ),
            GestureDetector(
              onTap: () async {
                UserCredential u = await Authentification().firebaseSignup(
                  emailController.text.toLowerCase().trim(),
                  passwordController.text.trim(),
                );
                if (u != null) {
                  User user = Authentification().logedUser();
                  Get.to(
                      Dashboard(
                        uid: user.uid,
                      ),
                      transition: Transition.leftToRight);
                  print('signup Successful');
                }
              },
              child: Container(
                height: 40,
                width: width * .7,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(55, 44, 113, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Text('Sign Up with'),
            SizedBox(
              height: height * .03,
            ),
            Row(
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () async {
                    bool googleAuth =
                        await Authentification().signInWithGoogle();
                    User user = Authentification().logedUser();
                    if (googleAuth != null && user != null) {
                      Get.to(
                          Dashboard(
                            uid: user.uid,
                          ),
                          transition: Transition.leftToRight);
                    } else {
                      Get.to(Welcome(), transition: Transition.leftToRight);
                    }
                  },
                  child: Image.asset(
                    'assets/Google.png',
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Image.asset(
                  'assets/Facebook.png',
                ),
                Spacer()
              ],
            ),
            SizedBox(
              height: height * .05,
            ),
            Row(
              children: [
                Spacer(),
                Text('Sign In'),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 12,
                  width: 2.5,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Forget password?'),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
