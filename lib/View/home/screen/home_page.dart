import 'package:flutter/material.dart';
import 'package:irshad/Core/Constants.dart';
import 'package:irshad/Core/pallete.dart';
import 'package:irshad/View/UpdateProfile/screen/updateProfile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const home(),
    const Activity(),
    const Community(),
    const ProfileUpdatePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            _pages[_currentIndex],
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: Colors.white, // Change to your preferred color
                ),
                child: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  backgroundColor: Colors.yellow,
                  onTap: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                        color: Pallete.blackColor,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.search,
                        color: Pallete.blackColor,
                      ),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.favorite,
                        color: Pallete.blackColor,
                      ),
                      label: 'Favorites',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.person,
                        color: Pallete.blackColor,
                      ),
                      label: 'Profile',
                    ),
                  ],
                  selectedItemColor: Pallete.secondaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Constants.light, // Replace with your image URL
      fit: BoxFit.cover,
    );
  }
}

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Constants.light, // Replace with your image URL
      fit: BoxFit.cover,
    );
  }
}

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Constants.light, // Replace with your image URL
      fit: BoxFit.cover,
    );
  }
}
