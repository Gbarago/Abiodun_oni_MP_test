import 'package:abiodun_mobile/helper/utils/colors.dart';
import 'package:abiodun_mobile/views/shipment/all_shipping_tab_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class InProgressSgipmentTabWidget extends StatelessWidget {
  const InProgressSgipmentTabWidget({super.key});

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
          const ShipmentWidget(status: 'In-Progress'),
          const ShipmentWidget(status: 'In-Progress')

          // ShipmentWidget().animate().blurXY(delay: Duration(seconds: 2)),
          // ShipmentWidget().animate().blurXY(delay: Duration(seconds: 3)),
          // ShipmentWidget().animate().blurXY(delay: Duration(seconds: 5)),
          //ShipmentWidget().animate().blurXY(delay: Duration(seconds: 6)),
        ],
      ).animate().fadeIn(duration: 500.ms).slideY(begin: .1, end: .0),
    );
  }
}
