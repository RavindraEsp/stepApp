import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:step_app/dashboard/dashboard_screen.dart';
import 'package:step_app/dashboard/dashboard_screen_provider.dart';
import 'package:step_app/utilities/color_utility.dart';
import 'package:step_app/utilities/image_utility.dart';
import 'package:step_app/utilities/style_utility.dart';



class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {

  int _selectedTab = 0;

  final List _pages = [



    DashBoardScreen(),

    Center(
      child: Text("About"),
    ),
    Center(
      child: Text("Products"),
    ),
    Center(
      child: Text("Contact"),
    ),
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: ColorUtility.colorFBF8FF,
        unselectedItemColor: ColorUtility.color999999,
        showUnselectedLabels: true,

        type: BottomNavigationBarType.fixed,


        selectedLabelStyle: StyleUtility.bottomTabTextStyle.copyWith(
          fontSize: 10
        ),

        // iconSize: 40,
        //
        // elevation: 5


        items: [

          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(

                  _selectedTab == 0 ?
                  ImageUtility.selectDashboardIcon:
                  ImageUtility.unselectDashboardIcon,
                  width: 22,
                ),
              ),
              label: "Dashboard"),

          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(

                  _selectedTab == 1 ?
                  ImageUtility.selectActivityIcon:
                  ImageUtility.unselectActivityIcon,
                  width: 22,
                ),
              ),
              label: "Activity"),


          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(

                  _selectedTab == 2 ?
                  ImageUtility.selectLeaderboardIcon:
                  ImageUtility.unselectLeaderboardIcon,
                  width: 22,
                ),
              ),
              label: "Leaderboard"),

          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset(

                  _selectedTab == 3 ?
                  ImageUtility.selectNftPackageIcon:
                  ImageUtility.unselectNftPackageIcon,
                  width: 22,
                ),
              ),
              label: "NFT Package"),





        ],
      ),

    );
  }
}

