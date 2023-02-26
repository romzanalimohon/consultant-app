// import 'package:flutter/material.dart';
//
// class ProfileDemoPage extends StatefulWidget {
//   const ProfileDemoPage({Key? key}) : super(key: key);
//
//   @override
//   State<ProfileDemoPage> createState() => _ProfileDemoPageState();
// }
//
// class _ProfileDemoPageState extends State<ProfileDemoPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(height: 20,),
//           Container(
//             height: 200,
//             width: 200,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(100),
//               child: Image( image: NetworkImage('https://cdn.myanimelist.net/images/characters/13/387881.jpg'),
//                   loadingBuilder: (context, child, loadingProgress){
//                         (loadingProgress == null)?
//                            child : Center(child: CircularProgressIndicator(),);
//
//                   },
//               ),
//
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
