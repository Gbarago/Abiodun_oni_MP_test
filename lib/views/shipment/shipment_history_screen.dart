import 'package:abiodun_mobile/helper/utils/colors.dart';
import 'package:abiodun_mobile/views/shipment/in_progress_shipment_tab_widget.dart';
import 'package:abiodun_mobile/views/shipment/pending_shipment_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/nav_provider.dart';
import 'all_shipping_tab_widget.dart.dart';

class ShipmentHistoryScreen extends StatelessWidget {
  const ShipmentHistoryScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);
    final tabs = [
      CustomTab(
        label: 'All',
        notificationCount: 22,
        isActive: tabProvider.selectedTabIndex == 0,
      ),
      CustomTab(
        label: 'Completed',
        notificationCount: 10,
        isActive: tabProvider.selectedTabIndex == 1,
      ),
      CustomTab(
        label: 'In progress',
        notificationCount: 9,
        isActive: tabProvider.selectedTabIndex == 2 ? true : false,
      ),
      CustomTab(
        label: 'Pending',
        notificationCount: 3,
        isActive: tabProvider.selectedTabIndex == 3,
      ),
      CustomTab(
        label: 'Canceled',
        isActive: tabProvider.selectedTabIndex == 4,
      ),
      CustomTab(
        label: 'Returned',
        notificationCount: 60,
        isActive: tabProvider.selectedTabIndex == 5,
      ),
    ];

    final tabController = TabController(
      length: tabs.length,
      vsync: Scaffold.of(context), // or use DefaultTabController.of(context)
    );

    return Scaffold(
      backgroundColor: blackLiteColor.withOpacity(0.01),
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            tabProvider.setPageIndex(0);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Shipment History'),
        bottom: TabBar(
          isScrollable: true,
          controller: tabController,
          tabs: tabs,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          // Your tab content for each tab goes here
          AllSgipmentTabWidget(),
          SizedBox(
            child: Center(
              child: Text('No Items'),
            ),
          ),
          InProgressSgipmentTabWidget(),

          PendingSgipmentTabWidget(),
          SizedBox(
            child: Center(
              child: Text('No Items'),
            ),
          ),
          SizedBox(
            child: Center(
              child: Text('No Items'),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  final String label;
  final int notificationCount;
  final bool? isActive;

  CustomTab({
    required this.label,
    this.notificationCount = 0,
    this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        children: [
          //    const Row(

          Row(
            children: [
              Text(
                label,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: 23,
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: isActive == true
                      ? accentColor
                      : Colors.white10.withOpacity(0.25),
                ),
                child: Center(
                  child: Text(
                    notificationCount.toString(),
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
