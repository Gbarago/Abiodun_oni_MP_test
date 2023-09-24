import 'package:abiodun_mobile/helper/utils/colors.dart';
import 'package:abiodun_mobile/helper/utils/screen_aware_size.dart';
import 'package:abiodun_mobile/providers/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const Padding(
                padding: EdgeInsets.only(left: 10),
                child: const CircleAvatar()),
            centerTitle: false,
            title: const Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.share_location),
                    Text(
                      '  Your location',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                    )
                  ],
                ),
                Row(
                  children: [Text('Werthiemer Illinois')],
                )
              ],
            ),
            actions: const [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.notifications_on_outlined),
              ),
            ],
            expandedHeight: screenAwareSize(120, context),
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                width: myScreenWidth(0.85, context),
                height: screenAwareSize(30, context),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.search,
                      color: primaryColor,
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          hintText: 'Enter the receipt number ...',
                          hintStyle: TextStyle(fontSize: 12)),
                    )),
                    Padding(
                      padding: EdgeInsets.all(4.3),
                      child: CircleAvatar(
                        backgroundColor: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            pinned: false,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Text("Tracking",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                height: 300,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.orange,
                    height: 300,
                  )),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.orange,
                    height: 300,
                  )),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.orange,
                    height: 300,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
