import 'package:abiodun_mobile/helper/utils/colors.dart';
import 'package:abiodun_mobile/views/shipment/all_shipping_tab_widget.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PendingSgipmentTabWidget extends StatelessWidget {
  const PendingSgipmentTabWidget({super.key});

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
          const ShipmentWidget(status: 'Pending'),
          const ShipmentWidget(status: 'Pending'),
          const ShipmentWidget(status: 'Pending'),
          const ShipmentWidget(status: 'Pending'),

          // ShipmentWidget().animate().blurXY(delay: Duration(seconds: 2)),
          // ShipmentWidget().animate().blurXY(delay: Duration(seconds: 3)),
          // ShipmentWidget().animate().blurXY(delay: Duration(seconds: 5)),
          //ShipmentWidget().animate().blurXY(delay: Duration(seconds: 6)),
        ],
      )
          .animate()
          .fadeIn(duration: 500.ms)
          // baseline=800ms
          .slide(begin: Offset(0, 1.0)),
    );
  }
}
