// import 'package:flutter/material.dart';
// import 'package:frontend/both/Account.dart';
// import 'package:frontend/both/LoginPage.dart';
//
// class settingPage extends StatefulWidget {
//
//   const settingPage({super.key});
//
//   @override
//   State<settingPage> createState() => _settingPageState();
// }
//
// class _settingPageState extends State<settingPage> {
//   bool isSwitched = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text("SETTING", style: TextStyle(color: Colors.black), ),
//         centerTitle: true,
//         iconTheme: const IconThemeData(
//           color: Colors.black, //change your color here
//         ),
//         automaticallyImplyLeading: true,
//       ),
//       body: Stack(
//         children: [
//           // --> tombol edit account
//           Column(
//               children: [
//                 GestureDetector(
//                   child: Center(
//                       child: Container(
//
//                           margin: const EdgeInsets.only(top: 50),
//                           width: 311.0,
//                           height: 51.0,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.rectangle,
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.black.withOpacity(0.1),
//                                     spreadRadius: 1,
//                                     blurRadius: 2,
//                                     offset: const Offset(5, 5)
//                                 )
//                               ]
//                           ),
//                           child: Row(
//                               children: const [
//                                 SizedBox(width: 20,),
//                                 Icon(Icons.person_outline,size: 35),
//                                 SizedBox(height: 100,width: 20,),
//                                 Text("Account",style: TextStyle(fontSize: 14)),
//                                 SizedBox(width: 130,),
//                                 // Icon(Icons.arrow_forward,size: 25),
//                               ]
//                           )
//                       )
//                   ),
//                   onTap: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=> edit_account()));
//                   },
//                 )
//               ]
//           ),
//           // --> on off notification disetting
//           Column(
//               children: [
//                 GestureDetector(
//                   child: Center(
//                       child: Container(
//
//                           margin: const EdgeInsets.only(top: 130),
//                           width: 311.0,
//                           height: 51.0,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.rectangle,
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.black.withOpacity(0.1),
//                                     spreadRadius: 1,
//                                     blurRadius: 2,
//                                     offset: const Offset(5, 5)
//                                 )
//                               ]
//                           ),
//                           child: Row(
//                               children: [
//                                 const SizedBox(width: 20,),
//                                 const Icon(Icons.notifications_none_outlined,size: 35),
//                                 const SizedBox(height: 100,width: 20,),
//                                 const Text("Notification",style: TextStyle(fontSize: 14)),
//                                 const SizedBox(width: 90,),
//                                 Switch(value: isSwitched, onChanged:(value){
//                                   setState(() {
//                                     isSwitched = value;
//                                   });
//                                 }
//                                 ),
//
//                               ]
//                           )
//                       )
//                   ),
//                 )
//               ]
//           ),
//           // --> logout button
//           Column(
//               children: [
//                 GestureDetector(
//                   child: Center(
//                       child: Container(
//
//                           margin: const EdgeInsets.only(top: 210),
//                           width: 311.0,
//                           height: 51.0,
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.rectangle,
//                               borderRadius: BorderRadius.circular(20),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.black.withOpacity(0.1),
//                                     spreadRadius: 1,
//                                     blurRadius: 2,
//                                     offset: const Offset(5, 5)
//                                 )
//                               ]
//                           ),
//                           child: Row(
//                               children: const [
//                                 SizedBox(width: 20,),
//                                 Icon(Icons.logout_outlined,size: 35),
//                                 SizedBox(height: 100,width: 20,),
//                                 Text("LOGOUT",style: TextStyle(fontSize: 14)),
//                                 SizedBox(width: 130,),
//                                 // Icon(Icons.arrow_forward,size: 25),
//                               ]
//                           )
//                       )
//                   ),
//                   onTap: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
//                   },
//                 )
//               ]
//           ),
//
//         ],
//       ),
//
//     );
//   }
// }