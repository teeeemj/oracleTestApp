// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';


// @RoutePage()
// class DiscoverPage extends StatefulWidget {
//   const DiscoverPage({super.key});

//   @override
//   State<DiscoverPage> createState() => _DiscoverPageState();
// }

// class _DiscoverPageState extends State<DiscoverPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children[ Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 32),
//               const Text('Whats new today'),
//               const SizedBox(height: 32),
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     Container(width: 343, child: const Text('Image1')),
//                     Container(width: 343, child: const Text('Image2')),
//                     Container(width: 343, child: const Text('Image3')),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 42),
//               const Text('Browse all'),
//               const SizedBox(height: 32),
//               Expanded(
//                 child: GridView.builder(
//                   itemCount: 10,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 16,
//                     mainAxisSpacing: 16,
//                   ),
//                   itemBuilder: (BuildContext context, int index) {
//                     return Container(
//                       color: Colors.grey,
//                       child: Center(
//                         child: Text('Image ${index + 1}'),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
        
//       ),
//     );
//   }
// }

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';




@RoutePage()
class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const Text('Whats new today'),
            const SizedBox(height: 32),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(width: 343, child: const Text('Image1')),
                  Container(width: 343, child: const Text('Image2')),
                  Container(width: 343, child: const Text('Image3')),
                ],
              ),
            ),
            const SizedBox(height: 42),
            const Text('Browse all'),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.grey,
                    child: Center(
                      child: Text('Image ${index + 1}'),
                    ),
                  );
                },
                itemCount: 10, // Change this to the actual number of items
              ),
            ),
          ],
        ),
      ),
    );
  }
}
