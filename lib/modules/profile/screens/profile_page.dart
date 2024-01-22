import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:testapp/core/config/routes/app_router.dart';
import 'package:testapp/core/config/theme/app_fonts.dart';

import 'package:testapp/modules/authorization/presentations/widgets/start_screen_button.dart';

import '../../../core/config/theme/app_colors.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> imageUrls = [];
  int _currentIndex = 4;

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  Future<void> loadImages() async {
    try {
      final dio = Dio();
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/photos');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        setState(() {
          imageUrls =
              List<String>.from(data.map((item) => item['thumbnailUrl']));
        });
      } else {
        throw Exception('Failed to load images');
      }
    } catch (error) {
      print('Error loading images: $error');
      throw Exception('Failed to load images');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 76),
              const Center(
                child: SizedBox(
                  height: 128,
                  width: 123,
                  child: Image(
                    image: AssetImage('assets/images/pngs/profile_png.png'),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Jane',
                style: AppFonts.s36w400rob.copyWith(
                  color: AppColors.textColorBlack,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'SAN FRANCISCO',
                style: AppFonts.s13w900rob.copyWith(
                  color: AppColors.textColorBlack,
                ),
              ),
              const SizedBox(height: 32),
              StartScreenButton(
                title: 'FOLLOW JANE',
                onPressed: () {},
                buttonPaddings: const EdgeInsets.symmetric(
                  horizontal: 128,
                  vertical: 19,
                ),
                btnColor: AppColors.textColorWhite,
                bgColor: AppColors.buttonColorBlack,
              ),
              const SizedBox(height: 16),
              StartScreenButton(
                title: 'MESSAGE',
                onPressed: () {},
                buttonPaddings: const EdgeInsets.symmetric(
                  horizontal: 140,
                  vertical: 19,
                ),
                btnColor: AppColors.textColorBlack,
                bgColor: AppColors.buttonColorWhite,
              ),
              _buildGridView(),
              const SizedBox(height: 32),
              //bottomnavbar
              Center(
                child: SizedBox(
                  height: 52,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColorWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                        side: const BorderSide(
                          width: 2,
                          color: AppColors.buttonColorBlack,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'SEE MORE',
                      style: AppFonts.s13w900rob.copyWith(
                        color: AppColors.textColorBlack,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
              context.router.push(const SearchRoute());
            } else if (index == 2) {
              context.router.push(const AddRoute());
            } else if (index == 3) {
              context.router.push(const ChatRoute());
            } else if (index == 4) {}
          }
        },
      ),
    );
  }

  Widget _buildGridView() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (BuildContext context, int index) {
          if (imageUrls != null && index < imageUrls.length) {
            return Image.network(
              imageUrls[index],
              fit: BoxFit.cover,
            );
          } else {
            return Container();
          }
        },
        itemCount: 10,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
