import 'package:codecany1/auth/authentification.dart';
import 'package:codecany1/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  final String uid;
  Dashboard({@required this.uid});
  Future<void> signOut() async {
    await Authentification().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: ElevatedButton(
        onPressed: () {
          signOut();
          Get.to(Welcome(), transition: Transition.leftToRight);
        },
        child: Text('logout'),
      ),
    );
  }
}
