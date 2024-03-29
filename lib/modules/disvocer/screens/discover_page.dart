import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:testapp/core/config/routes/app_router.dart';
import 'package:testapp/core/config/theme/app_colors.dart';
import 'package:testapp/core/config/theme/app_fonts.dart';

import '../widgets/discover_main_images.dart';

@RoutePage()
class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<String> imageUrls = [];
  int _currentIndex = 0;

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

  List<String> authorNames = ['Ridhwan Nordin'];
  List<String> authorUserNames = ['@ridzjcob'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 76),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Discover',
                style: AppFonts.s36w400rob.copyWith(
                  color: AppColors.textColorBlack,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Whats new today',
                style: AppFonts.s13w900rob.copyWith(
                  color: AppColors.textColorBlack,
                ),
              ),
              const SizedBox(height: 24),
              _buildDiscoverContent(),
              const SizedBox(height: 48),
              Text(
                'Browse all',
                style: AppFonts.s13w900rob.copyWith(
                  color: AppColors.textColorBlack,
                ),
              ),
              const SizedBox(height: 24),
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
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: AppColors.buttonColorBlack,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                color: AppColors.buttonColorBlack,
              ),
              label: '',
              backgroundColor: Color(0xffff00d6)),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble,
              color: AppColors.buttonColorBlack,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: AppColors.buttonColorBlack,
            ),
            label: '',
          ),
        ],
        onTap: (index) {
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
          } else if (index == 4) {
            context.router.push(const ProfileRoute());
          }
        },
      ),
    );
  }

  Widget _buildDiscoverContent() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DiscoverMainImages(
            image: const AssetImage('assets/images/pngs/discover_1.png'),
            mySvg: 'assets/images/svgs/component_1.svg',
          ),
          const SizedBox(width: 16),
          DiscoverMainImages(
            image: const AssetImage('assets/images/pngs/discover_2.png'),
            mySvg: 'assets/images/svgs/component_2.svg',
          ),
          const SizedBox(width: 16),
          DiscoverMainImages(
            image: const AssetImage('assets/images/pngs/discover_3.png'),
            mySvg: 'assets/images/svgs/component_3.svg',
          ),
          const SizedBox(width: 16),
          DiscoverMainImages(
            image: const AssetImage('assets/images/pngs/discover_4.png'),
            mySvg: 'assets/images/svgs/component_4.svg',
          ),
        ],
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
