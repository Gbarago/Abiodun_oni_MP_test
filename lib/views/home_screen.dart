import 'package:abiodun_mobile/helper/utils/assets.dart';
import 'package:abiodun_mobile/helper/utils/colors.dart';
import 'package:abiodun_mobile/helper/utils/screen_aware_size.dart';
import 'package:abiodun_mobile/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        toolbarHeight: 170,
        centerTitle: false,
        automaticallyImplyLeading: true,
        title: Column(
          children: [
            Row(
              children: [
                const Padding(
                    padding: EdgeInsets.only(left: 5, right: 10),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(AppAssets.profilePng),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          AppAssets.telegram,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          'Your location',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          'Werthiemer Illinois',
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: screenAwareSize(95, context),
                ),
                const Expanded(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.notifications_on_outlined,
                      color: blackLiteColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenAwareSize(20, context),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.searchProductsScreen);
              },
              child: const AppBarSearchWidget(
                isEnabled: false,
              ),
            ),
          ],
        ).animate().fadeIn(duration: 500.ms).slideY(begin: .0, end: .1),
      ),
      body: SizedBox(
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
                child: Card(
              elevation: 0.5,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                height: myScreenHeight(1, context) > 700
                    ? 310
                    : screenAwareSize(310, context),
                child: Column(
                  children: [
                    ListTile(
                      title: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Shipment Number',
                              style: TextStyle(fontSize: 14)),
                          Text('NEJ2008992413301',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                        ],
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.only(top: 8),
                        child:
                            const Image(image: AssetImage(AppAssets.forklift)),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        height: 4,
                        color: Colors.black45.withOpacity(0.2),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SenderReceiverCardWidget(
                      isSender: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SenderReceiverCardWidget(
                      isSender: false,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        height: 4,
                        color: Colors.black45.withOpacity(0.2),
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
                              color: accentColor, fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
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
          AnimatedSliverToBoxAdapter(),
        ]).animate().fadeIn(duration: 300.ms).slide(begin: const Offset(0, .3)),
      ),
    );
  }
}

class AppBarSearchWidget extends StatelessWidget {
  final TextEditingController? searchController;
  final bool isEnabled;

  final void Function(String)? onChanged;

  const AppBarSearchWidget(
      {super.key,
      required this.isEnabled,
      this.searchController,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      width: myScreenWidth(0.85, context),
      height: screenAwareSize(37, context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.search,
            color: primaryColor,
          ),
          Expanded(
              child: TextField(
            enabled: isEnabled,
            controller: searchController,
            onChanged: onChanged,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: ' Enter the receipt number ...',
                hintStyle: TextStyle(fontSize: 12)),
          )),
          Padding(
            padding: const EdgeInsets.all(4.3),
            child: CircleAvatar(
              backgroundColor: Colors.orange,
              child: SvgPicture.asset(
                AppAssets.scan,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SenderReceiverCardWidget extends StatelessWidget {
  final bool isSender;
  const SenderReceiverCardWidget({
    super.key,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 30,
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
            SizedBox(
              width: 140,
              child: Row(
                children: [
                  if (isSender == true)
                    Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
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

class _AnimatedSliverToBoxAdapterState extends State<AnimatedSliverToBoxAdapter>
    with SingleTickerProviderStateMixin {
  bool _animate = false;

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    // Start the animation when the widget is built
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _animate = true;
        _animationController.forward(); // Start the animation
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final position = Tween<Offset>(
      begin: const Offset(1.0, 0), // Start from the right
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          (1 + 1) / 3, // Adjust the intervals
          1.0,
          curve: Curves.bounceIn, // Apply bounce effect
        ),
      ),
    );

    final opacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          (1 + 1) / 3, // Adjust the intervals
          1.0,
          curve: Curves.bounceIn, // Apply fade-in effect
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 200,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return ListView(
                scrollDirection: Axis.horizontal,
                //  controller: _scrollController,
                children: [
                  Container(
                    width: 180,
                    child: SlideTransition(
                      position: position,
                      child: GridTile(
                        header: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ocean Freight',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: blackLiteColor.withOpacity(0.8)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text('International',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: blackLiteColor.withOpacity(0.8))),
                          ],
                        ),
                        child: Image(image: AssetImage(AppAssets.ship)),
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    child: FadeTransition(
                      opacity: opacity,
                      child: SlideTransition(
                        position: position,
                        child: GridTile(
                          header: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ocean Freight',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: blackLiteColor.withOpacity(0.8)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text('Reliable',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: blackLiteColor.withOpacity(0.8))),
                            ],
                          ),
                          child: Image(image: AssetImage(AppAssets.truck)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    child: FadeTransition(
                      opacity: opacity,
                      child: SlideTransition(
                        position: position,
                        child: GridTile(
                          header: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ocean Freight',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: blackLiteColor.withOpacity(0.8)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text('International',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: blackLiteColor.withOpacity(0.8))),
                            ],
                          ),
                          child: Image(image: AssetImage(AppAssets.plane))
                              .animate()
                              .fadeIn(duration: 600.ms)
                              .slide(begin: const Offset(.3, 0.0)),
                        ),
                      ),
                    ),
                  ),
                ],
              )
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slide(begin: const Offset(.3, 0.0));
            },
          ),
        ),
      ),
    );
  }
}
