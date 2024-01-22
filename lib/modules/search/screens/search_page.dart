import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:testapp/core/config/routes/app_router.dart';
import 'package:testapp/core/config/theme/app_colors.dart';
import 'package:testapp/core/config/theme/app_fonts.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 76),
            Text(
              'Search',
              style: AppFonts.s36w400rob.copyWith(
                color: AppColors.textColorBlack,
              ),
            ),
            const SizedBox(height: 32),
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.buttonColorBlack,
                    width: 2,
                  ),
                ),
                hintText: 'Search all photos',
                hintStyle: AppFonts.s15w400rob.copyWith(
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                ),
              ),
            ),
          ],
        ),
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
            } else if (index == 2) {
              context.router.push(const AddRoute());
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
