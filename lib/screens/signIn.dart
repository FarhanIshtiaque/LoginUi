import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width;
    double Height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: Height*.03,left: Width*.8),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(110, 172, 253, 1),
                  shape: BoxShape.circle,
                ),

              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:Width*.6 ),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(172, 206, 252, 1.0),
                  shape: BoxShape.circle,
                ),

              ),
            ),
            SizedBox(height: Height*.08,),
            Align(
              alignment: Alignment.center,
              child: Text(

                'Welcome',
                style: GoogleFonts.pacifico(

                  color: Colors.black,
                  fontSize: 28,
                ),
              ),
            ),
            SizedBox(height: Height*.10,),
            Column(
              children: [

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    // controller: emailController,
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
                  height: Height / 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    // controller: passwordController,
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
                SizedBox(height: Height*.05,),
                Container(
                  height: 40,
                  width: Width * .7,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(110, 172, 253, 1),
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
                SizedBox(height: Height*.05,),
                Row(
                  children: [
                    Spacer(),
                    Text('Sign Up'),
                    SizedBox(width: 10,),
                    Container(
                      height: 12,
                      width: 2.5,
                      color: Colors.black,
                    ),
                    SizedBox(width: 10,),
                    Text('Forget password?'),
                    Spacer(),

                  ],
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
