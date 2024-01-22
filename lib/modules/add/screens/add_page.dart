import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:testapp/core/config/routes/app_router.dart';

import '../../../core/config/theme/app_colors.dart';

@RoutePage()
class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add'),
      ),
      body: const Center(
        child: Text('Add Page Content'),
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
            } else if (index == 3) {
              context.router.push(const ChatRoute());
            } else if (index == 4) {
              context.router.push(const ProfileRoute());
            }
          }
        },
      ),
    );
  }
}
