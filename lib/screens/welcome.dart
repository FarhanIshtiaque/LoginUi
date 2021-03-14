import 'package:codecany1/screens/signUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'signIn.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: Width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/28.jpg"), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            SizedBox(height: Height*.17,),
            Text(
              'Welcome to our app',
              style: GoogleFonts.pacifico(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {


                Get.to(SignUp(),

                    transition: Transition.leftToRight);
              },
              child: Container(
                height: 40,
                width: Width * .5,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, .4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                Get.to(SignIn(),
                    transition: Transition.leftToRight);
              },
              child: Container(
                height: 40,
                width: Width * .5,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, .4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: Height*.17,)
          ],
        ),
      ),
    );
  }
}
