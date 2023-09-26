import 'package:abiodun_mobile/helper/utils/assets.dart';
import 'package:abiodun_mobile/helper/utils/colors.dart';
import 'package:abiodun_mobile/helper/utils/screen_aware_size.dart';
import 'package:abiodun_mobile/providers/nav_provider.dart';
import 'package:abiodun_mobile/views/home_screen.dart';
import 'package:abiodun_mobile/views/shipment/shipment_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'calculate_views/calculate_Screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return MyHomePage();
      case 1:
        return CalculateScreen();
      case 2:
        return ShipmentHistoryScreen();
      case 3:
        return Container(child: Center(child: Text('3rd tab')));

      case 4:
        return Container(child: Center(child: Text('5th tab')));
      default:
        return MyHomePage();
    }
  }

  // bool _bottomNavBarVisible = true;

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);

    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: Container(
          child: Center(
            child: _getPage(tabProvider.pageIndex),
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          Visibility(
            visible: tabProvider.bottomNavBarVisible,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0.0, 1.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: tabProvider.bottomNavBarVisible
                    ? AlwaysStoppedAnimation(1)
                    : AlwaysStoppedAnimation(0),
                curve: Curves.fastOutSlowIn,
              )),
              child: AnimatedOpacity(
                opacity: tabProvider.pageIndex == 2 ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: BottomNavigationBar(
                  selectedItemColor: primaryColor,
                  unselectedItemColor: blackLiteColor,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  elevation: 1,
                  currentIndex: tabProvider.pageIndex,
                  onTap: (index) {
                    tabProvider.setPageIndex(index);

                    tabProvider.setNavVisibility(index);
                    // Update the page index
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppAssets.home,
                        color: tabProvider.pageIndex == 0 ? primaryColor : null,
                        height: 30,
                        width: 30,
                      ),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppAssets.calculate,
                        color: tabProvider.pageIndex == 1 ? primaryColor : null,
                        height: 30,
                      ),
                      label: 'Calculate',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppAssets.shipment,
                        color: tabProvider.pageIndex == 2 ? primaryColor : null,
                        height: 30,
                      ),
                      label: 'Shipment',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppAssets.profile,
                        color: tabProvider.pageIndex == 3 ? primaryColor : null,
                        height: 30,
                      ),
                      label: 'profile',
                    ),
                  ],
                )
                    .animate()
                    .fadeIn(duration: 500.ms)
                    .slide(begin: const Offset(0, 1.0)),
              ),
            ),
          ),
          Positioned(
            bottom: screenAwareSize(62, context),
            left: (tabProvider.pageIndex *
                (MediaQuery.of(context).size.width / 4)),
            child: AnimatedOpacity(
              opacity: tabProvider.pageIndex == 2 ? 0.0 : 1.0,
              duration: Duration(milliseconds: 300),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500), //
                alignment: Alignment(tabProvider.pageIndex * 2 - 1.0, 1.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 4, // Height of the indicator
                  color: primaryColor, // Color of the indicator
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
