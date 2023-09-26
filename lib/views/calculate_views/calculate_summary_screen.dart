import 'package:abiodun_mobile/helper/utils/assets.dart';
import 'package:abiodun_mobile/helper/utils/colors.dart';
import 'package:abiodun_mobile/helper/utils/screen_aware_size.dart';
import 'package:abiodun_mobile/providers/nav_provider.dart';
import 'package:abiodun_mobile/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import 'count_widget.dart';

class CalculateSummaryScreen extends StatelessWidget {
  const CalculateSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: screenAwareSize(100, context),
          ),
          Center(
              child: SizedBox(
                  height: screenAwareSize(120, context),
                  child: const Image(
                    image: AssetImage(
                      AppAssets.shipmentBox,
                    ),
                    fit: BoxFit.cover,
                  ))),
          SizedBox(
            height: screenAwareSize(40, context),
          ),
          Text(
            'Total Estimate  Amount',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: blackLiteColor),
          ),
          SizedBox(
            height: screenAwareSize(10, context),
          ),
          Container(child: CountingNumberAnimation()),
          SizedBox(
            height: screenAwareSize(7, context),
          ),
          Center(
            child: SizedBox(
              width: myScreenWidth(0.7, context),
              child: const Text(
                'This amount is estimated this will vary if you change your location or weight',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: blackLiteColor),
              ),
            ),
          ),
          SizedBox(
            height: screenAwareSize(15, context),
          ),
          GestureDetector(
            onTap: () async {
              tabProvider.setTabIndex(0);
              tabProvider.setPageIndex(2);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.dashboard, (route) => false);
            },
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(40)),
                    child: const Center(
                      child: Text(
                        'Back to home ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ).animate().fadeIn(duration: 500.ms).slideY(begin: .0, end: .1),
          )
        ],
      ).animate().fadeIn(duration: 500.ms).slideY(begin: .0, end: .1),
    );
  }
}
