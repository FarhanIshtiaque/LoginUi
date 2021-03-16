import 'package:codecany1/auth/authentification.dart';
import 'package:codecany1/screens/signUp.dart';
import 'package:codecany1/screens/welcome.dart';
// import 'package:codecany1/bloc_provider/auth_provider.dart';
// import 'package:codecany1/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:provider/provider.dart';

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
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       appBar: AppBar(
//         title: Text('Dashboard'),
//       ),
//       body: Consumer<AuthStatusProvider>(
//         builder: (contex, authStatus, child) {
//           if (authStatus.authStatus) {
//             return Container(
//               child: Column(
//                 children: [
//                   Text('${authStatus.authStatus}'),
//                   ElevatedButton(
//                     onPressed: signOut,
//                     child: Text('logout'),
//                   )
//                 ],
//               ),
//             );
//           } else {
//             return Welcome();
//           }
//         },
//       ));
// }
// }
