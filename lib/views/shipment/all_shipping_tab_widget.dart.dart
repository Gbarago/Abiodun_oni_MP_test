import 'package:abiodun_mobile/helper/utils/assets.dart';
import 'package:abiodun_mobile/helper/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class AllSgipmentTabWidget extends StatelessWidget {
  const AllSgipmentTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Shipments",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: darkerPrimaryColor,
                ),
              ),
            ],
          ),
          const ShipmentWidget(status: 'In-Progress'),
          const ShipmentWidget(status: 'In-Progress'),
          const ShipmentWidget(status: 'Pending'),
          const ShipmentWidget(status: 'Loading')
        ],
      ).animate().fadeIn(duration: 500.ms).slideY(begin: .1, end: .0),
    );
  }
}

class ShipmentWidget extends StatelessWidget {
  final String status;
  const ShipmentWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Card(
            elevation: 0.05,
            child: Container(
              height: 150,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: blackLiteColor.withOpacity(0.1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppAssets.pending,
                              height: 20,
                              color: status == 'Pending'
                                  ? accentColor
                                  : status == 'Loading'
                                      ? Colors.blue
                                      : Colors.teal,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              status,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: status == 'Pending'
                                    ? accentColor
                                    : status == 'Loading'
                                        ? Colors.blue
                                        : Colors.teal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Arriving todat!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: appBlack,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Ypur delivery, #NEJ20089934122231",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: blackLiteColor,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "from Atlanta, is arriving today!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: blackLiteColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        '\$250 USD',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 7),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: blackLiteColor.withOpacity(0.5),
                        ),
                      ),
                      const Text(
                        "Sep 20,2023",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: blackLiteColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 40,
            right: 5,
            child:
                SizedBox(height: 70, child: Image.asset(AppAssets.shipmentBox)))
      ],
    );
  }
}
