// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:ecommerce/services/local_notification_service.dart';
// import 'package:provider/provider.dart';
//
// import '../../viewmodels/auth_viewmodel.dart';
// import '../../viewmodels/global_ui_viewmodel.dart';
//
// class AccountScreen extends StatefulWidget {
//   const AccountScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AccountScreen> createState() => _AccountScreenState();
// }
//
// class _AccountScreenState extends State<AccountScreen> {
//
//   void logout() async{
//     _ui.loadState(true);
//     try{
//       await _auth.logout().then((value){
//         Navigator.of(context).pushReplacementNamed('/login');
//       })
//           .catchError((e){
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
//       });
//     }catch(err){
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err.toString())));
//     }
//     _ui.loadState(false);
//   }
//
//   late GlobalUIViewModel _ui;
//   late AuthViewModel _auth;
//   @override
//   void initState() {
//     _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
//     _auth = Provider.of<AuthViewModel>(context, listen: false);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           SizedBox(
//             height: 10,
//           ),
//           Image.asset(
//             "assets/images/logo.png",
//             height: 100,
//             width: 100,
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             child: Text(_auth.loggedInUser!.email.toString()),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           makeSettings(
//               icon: Icon(Icons.sell),
//               title: "My Products",
//               subtitle: "Get listing of my products",
//               onTap: (){
//                 Navigator.of(context).pushNamed("/my-products");
//               }
//           ),
//           makeSettings(
//               icon: Icon(Icons.logout),
//               title: "Logout",
//               subtitle: "Logout from this application",
//               onTap: (){
//                 logout();
//               }
//           ),
//           makeSettings(
//               icon: Icon(Icons.android),
//               title: "Version",
//               subtitle: "0.0.1",
//               onTap: (){
//
//               }
//           )
//         ],
//       ),
//     );
//   }
//
//   makeSettings({required Icon icon, required String title, required String subtitle, Function()? onTap}) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 5),
//         child: Card(
//             elevation: 4,
//             color: Colors.white,
//             child: ListTile(
//                 tileColor: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(0.5),
//                 ),
//                 contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 leading: icon,
//                 title: Text(
//                   title,
//                 ),
//                 subtitle: Text(
//                   subtitle,
//                 ))),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/services/local_notification_service.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/auth_viewmodel.dart';
import '../../viewmodels/global_ui_viewmodel.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  void logout() async {
    _ui.loadState(true);
    try {
      await _auth.logout().then((value) {
        Navigator.of(context).pushReplacementNamed('/login');
      }).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
      });
    } catch (err) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(err.toString())));
    }
    _ui.loadState(false);
  }

  late GlobalUIViewModel _ui;
  late AuthViewModel _auth;

  @override
  void initState() {
    _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
    _auth = Provider.of<AuthViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(
              "assets/images/logo.png",
              height: 100,
              width: 100,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Account Information",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text(_auth.loggedInUser!.email.toString()),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Settings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          makeSettings(
            icon: Icon(Icons.sell),
            title: "My Products",
            subtitle: "Get listing of my products",
            onTap: () {
              Navigator.of(context).pushNamed("/my-products");
            },
          ),
          makeSettings(
            icon: Icon(Icons.logout),
            title: "Logout",
            subtitle: "Logout from this application",
            onTap: () {
              logout();
            },
          ),
          makeSettings(
            icon: Icon(Icons.android),
            title: "Version",
            subtitle: "0.0.1",
            onTap: () {},
          )
        ],
      ),
    );
  }

  Widget makeSettings({required Icon icon, required String title, required String subtitle, Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Card(
          elevation: 4,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: icon,
            title: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              subtitle,
            ),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}

