import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:testapp/core/config/routes/app_router.dart';
import 'package:testapp/core/config/theme/app_fonts.dart';

import '../../../core/config/theme/app_colors.dart';
import '../widgets/chat_containers.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 11),
            Center(
              child: Text(
                'Chats',
                style: AppFonts.s17w400rob.copyWith(
                  color: AppColors.textColorBlack,
                ),
              ),
            ),
            const SizedBox(height: 11),
            const ChatContainers(
              image: 'assets/images/pngs/chat_image_1.png',
              name: 'James',
              text: 'Thank you! That was very helpful!',
            ),
            const ChatContainers(
              image: 'assets/images/pngs/chat_image_2.png',
              name: 'Will Kenny',
              text: 'I know... I’m trying to get the funds.',
            ),
            const ChatContainers(
              image: 'assets/images/pngs/chat_image_3.png',
              name: 'Beth Williams',
              text:
                  'I’m looking for tips around capturing the\nmilky way. I have a 6D with a 24-100mm...',
            ),
            const ChatContainers(
              image: 'assets/images/pngs/chat_image_4.png',
              name: 'Rev Shawn',
              text:
                  'Wanted to ask if you’re available for a portrait\nshoot next week.',
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: AppColors.buttonColorBlack,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: AppColors.buttonColorBlack,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                color: AppColors.buttonColorBlack,
              ),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble,
                color: AppColors.buttonColorBlack,
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: AppColors.buttonColorBlack,
              ),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            if (index != _currentIndex) {
              setState(() {
                _currentIndex = index;
              });

              if (index == 0) {
                context.router.push(const DiscoverRoute());
              } else if (index == 1) {
                context.router.push(const SearchRoute());
              } else if (index == 2) {
                context.router.push(const AddRoute());
              } else if (index == 3) {
              } else if (index == 4) {
                context.router.push(const ProfileRoute());
              }
            }
          },
        ),
      ),
    );
  }
}
