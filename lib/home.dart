import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticket_booking/in_theaters.dart';
import 'package:ticket_booking/news.dart';
import 'package:ticket_booking/settings.dart';
import 'package:ticket_booking/theaters.dart';
import 'package:ticket_booking/theme/Colors.dart';
import 'package:ticket_booking/upcoming.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double selectedIconSize = 32;
  final double unSelectedIconSize = 28;
  final List<BottomNavigationBarItem> _bottomNavigationItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/cinema.svg',
        width: 28,
        height: 28,
      ),
      title: Text('In Theaters'),
      activeIcon: SvgPicture.asset('assets/cinema.svg',
          width: 28, height: 28, color: accentColor),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/video-camera.svg',
        width: 28,
        height: 28,
      ),
      title: Text('Upcoming'),
      activeIcon: SvgPicture.asset('assets/video-camera.svg',
          width: 28, height: 28, color: accentColor),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/cinema-2.svg',
        width: 28,
        height: 28,
      ),
      title: Text('Theaters'),
      activeIcon: SvgPicture.asset('assets/cinema-2.svg',
          width: 28, height: 28, color: accentColor),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/speaker.svg',
        width: 28,
        height: 28,
      ),
      title: Text('News'),
      activeIcon: SvgPicture.asset('assets/speaker.svg',
          width: 28, height: 28, color: accentColor),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        'assets/settings.svg',
        width: 28,
        height: 28,
      ),
      title: Text('Settings'),
      activeIcon: SvgPicture.asset(
        'assets/settings.svg',
        width: 28,
        height: 28,
        color: accentColor,
      ),
    ),
  ];
  final List<Widget>_pages = [InTheaters(),Upcoming(),Theaters(),News(),Settings()];
  int _selectedBottomItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationItems,
        currentIndex: _selectedBottomItem,
        onTap: (selected) {
          setState(
            () {
              _selectedBottomItem = selected;
            },
          );
        },
        iconSize: 24,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedIconTheme: IconThemeData(size: unSelectedIconSize),
        selectedIconTheme:
            IconThemeData(color: accentColor, size: selectedIconSize),
        backgroundColor: backgroundColor,
        selectedItemColor: accentColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: primaryTextColor,
        selectedLabelStyle: TextStyle(color: accentColor),
        unselectedLabelStyle: TextStyle(color: primaryTextColor),
      ),
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: _pages[_selectedBottomItem],
      ),
    );
  }
}
