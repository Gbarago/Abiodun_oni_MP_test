import 'package:abiodun_mobile/helper/utils/assets.dart';
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
              child: SizedBox(
                height: 30,
                child: Text(
                  "Tracking",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: darkerPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                  child: Card(
                elevation: 0.5,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  height: 300,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipment Number',
                                style: TextStyle(fontSize: 16)),
                            Text('NEJ2008992413301',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600)),
                          ],
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.only(top: 8),
                          child: const Image(
                              image: AssetImage(AppAssets.forklift)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          height: 4,
                          color: Colors.black45,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SenderReceiverCardWidget(
                        isSender: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SenderReceiverCardWidget(
                        isSender: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Divider(
                          height: 4,
                          color: Colors.black45,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: accentColor,
                          ),
                          Text(
                            ' Add Stop',
                            style: TextStyle(
                                color: accentColor,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 30,
                child: Text(
                  "Avialable Vehicles",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: darkerPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
          //  SliverToBoxAdapter(
          //     // child: Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: ClipRRect(
          //       borderRadius: BorderRadius.circular(20),
          //       child: SizedBox(
          //         height: 200,
          //         child: ListView(
          //           scrollDirection: Axis.horizontal,
          //           children: [
          //             Container(
          //                 width: 200,
          //                 child: GridTile(
          //                   child: Image(image: AssetImage(AppAssets.ship)),
          //                 )),
          //             Container(
          //                 width: 200,
          //                 child: GridTile(
          //                   child: Image(image: AssetImage(AppAssets.truck)),
          //                 )),
          //             Container(
          //                 width: 200,
          //                 child: GridTile(
          //                   child: Image(image: AssetImage(AppAssets.ship)),
          //                 )),
          //           ],
          //         ),
          //       )),
          // ),

          //  child:
          AnimatedSliverToBoxAdapter(),
          //  ),
        ],
      ),
    );
  }
}

class SenderReceiverCardWidget extends StatelessWidget {
  final bool isSender;
  SenderReceiverCardWidget({
    super.key,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 30,
        // padding: const EdgeInsets.only(top: 10, right: 10),
        child: Image(
            image: AssetImage(isSender ? AppAssets.send : AppAssets.receive)),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isSender ? 'Senderr' : 'Receiver',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: blackLiteColor.withOpacity(0.8)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(isSender ? 'Atlanta, 5243' : 'Chicago, 6342',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: blackLiteColor.withOpacity(0.8))),
        ],
      ),
      trailing: SizedBox(
        height: 45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isSender ? ' Time' : 'Status',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: blackLiteColor.withOpacity(0.8)),
            ),
            // const SizedBox(
            //   height: 2,
            // ),
            SizedBox(
              width: 140,
              child: Row(
                children: [
                  if (isSender == true)
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  Text(isSender ? ' 2 day -3 days' : ' Waiting to collect',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: blackLiteColor.withOpacity(0.8))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedSliverToBoxAdapter extends StatefulWidget {
  @override
  _AnimatedSliverToBoxAdapterState createState() =>
      _AnimatedSliverToBoxAdapterState();
}

class _AnimatedSliverToBoxAdapterState
    extends State<AnimatedSliverToBoxAdapter> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            height: 200,
            child: AnimatedBuilder(
              animation: _scrollController,
              builder: (context, child) {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  children: [
                    Container(
                      width: 200,
                      child: GridTile(
                        child: Image(image: AssetImage(AppAssets.ship)),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: GridTile(
                        child: Image(image: AssetImage(AppAssets.truck)),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: GridTile(
                        child: Image(image: AssetImage(AppAssets.ship)),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
