// import 'package:flutter/material.dart';

// class BrowseGridImages extends StatelessWidget {
//   final String imgNetwork;
//   const BrowseGridImages({
//     super.key,
//     required this.imgNetwork,
//   });

//   get response => null;

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//         ),
//         itemBuilder: (BuildContext context, int index) {
//           return Image.network(imgNetwork[index]);
//         },
//         itemCount: 10,
//       ),
//     );
//   }
// }
