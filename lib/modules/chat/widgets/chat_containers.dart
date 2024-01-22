import 'package:flutter/material.dart';
import 'package:testapp/core/config/theme/app_fonts.dart';

import '../../../core/config/theme/app_colors.dart';

class ChatContainers extends StatelessWidget {
  final String image;
  final String name;
  final String text;
  const ChatContainers({
    super.key,
    required this.image,
    required this.name,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: AppColors.buttonColorBlack.withOpacity(0.3),
          ),
          bottom: BorderSide(
            width: 0.5,
            color: AppColors.buttonColorBlack.withOpacity(0.3),
          ),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 64,
            width: 64,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppFonts.s13w700rob.copyWith(
                  color: AppColors.textColorBlack,
                ),
              ),
              SizedBox(height: 6),
              Text(
                text,
                softWrap: true,
                maxLines: 3,
                style: AppFonts.s13w700rob.copyWith(
                  color: AppColors.textColorBlack,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
