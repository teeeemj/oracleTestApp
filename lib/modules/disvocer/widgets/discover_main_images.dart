import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiscoverMainImages extends StatelessWidget {
  final AssetImage image;
  final String mySvg;

  DiscoverMainImages({
    Key? key,
    required this.image,
    required this.mySvg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 343,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              width: MediaQuery.of(context).size.width,
              image: image,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          SvgPicture.asset(
            mySvg,
            height: 28,
            width: 139,
          ),
        ],
      ),
    );
  }
}
