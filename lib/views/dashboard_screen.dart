import 'package:abiodun_mobile/helper/utils/assets.dart';
import 'package:abiodun_mobile/helper/utils/colors.dart';
import 'package:abiodun_mobile/helper/utils/screen_aware_size.dart';
import 'package:abiodun_mobile/providers/nav_provider.dart';
import 'package:abiodun_mobile/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return MyHomePage(); // Replace with your home page widget
      case 1:
        return Container(
            child: Center(
                child:
                    Text('2nd tab'))); // Replace with your search page widget
      case 2:
        return Container(
            child: Center(
                child: Text('3rd tab'))); // Replace with your add page widget
      case 3:
        return Container(
            child: Center(
                child: Text(
                    '4th tab'))); // Replace with your favorites page widget
      case 4:
        return Container(
            child: Center(
                child:
                    Text('2nd tab'))); // Replace with your profile page widget
      default:
        return MyHomePage(); // Default to the home page
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);

    return Scaffold(
      body: Container(
        child: Center(
          child: _getPage(tabProvider.pageIndex), // Display the selected page
        ),
      ),
      bottomNavigationBar: Stack(
        children: [
          BottomNavigationBar(
            selectedItemColor: primaryColor,
            unselectedItemColor: blackLiteColor,
            showSelectedLabels:
                true, // Set to true to show labels for selected items
            showUnselectedLabels:
                true, // Set to true to show labels for unselected items

            elevation: 1,
            currentIndex: tabProvider.pageIndex,
            onTap: (index) {
              tabProvider.setPageIndex(index);
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
          ),
          Positioned(
            bottom: screenAwareSize(62, context),
            left: (tabProvider.pageIndex *
                (MediaQuery.of(context).size.width / 4)),
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
          // AnimatedContainer(
          //   duration: Duration(milliseconds: 300), // Adjust animation duration
          //   alignment: Alignment(tabProvider.pageIndex * 2 - 1.0, 1.0),
          //   child: FractionallySizedBox(
          //     widthFactor: 1 / 4, // Adjust based on the number of tabs
          //     child: Container(
          //       height: 2, // Height of the indicator
          //       color: primaryColor, // Color of the indicator
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
