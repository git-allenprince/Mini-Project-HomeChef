// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:homechef_v3/screens/Profile/get_username.dart';
//
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);
//   static const String routeName = '/profile-screen';
//
//   static Route route() {
//     return MaterialPageRoute(
//         builder: (_) => ProfileScreen(),
//         settings: RouteSettings(name: routeName));
//   }
//
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   // List<String> docIDs = [];
//   final user=FirebaseAuth.instance.currentUser!;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 Icons.person,
//                 size: 100,
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               Text('name'+FirebaseAuth.instance.currentUser?.displayName)
//               //
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
