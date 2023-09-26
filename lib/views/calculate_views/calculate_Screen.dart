import 'package:abiodun_mobile/data/category_data.dart';
import 'package:abiodun_mobile/helper/utils/assets.dart';
import 'package:abiodun_mobile/helper/utils/colors.dart';
import 'package:abiodun_mobile/helper/utils/screen_aware_size.dart';
import 'package:abiodun_mobile/providers/nav_provider.dart';
import 'package:abiodun_mobile/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

String selectedCategory = '';

class _CalculateScreenState extends State<CalculateScreen> {
  @override
  Widget build(BuildContext context) {
    final tabProvider = Provider.of<TabProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            tabProvider.setPageIndex(0);
            tabProvider.setNavVisibility(0);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text(
          'Calculate',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Destination',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: darkerPrimaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: screenAwareSize(50, context),
                decoration: BoxDecoration(
                    color: blackLiteColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: SvgPicture.asset(
                        AppAssets.sendAddress,
                        height: screenAwareSize(50, context),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, bottom: 15, right: 10),
                      child: const VerticalDivider(
                        color: appBlack,
                        width: 4,
                      ),
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Sender location'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: screenAwareSize(50, context),
                decoration: BoxDecoration(
                    color: blackLiteColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: SvgPicture.asset(
                        AppAssets.receiveAddress,
                        height: screenAwareSize(50, context),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, bottom: 15, right: 10),
                      child: const VerticalDivider(
                        color: appBlack,
                        width: 4,
                      ),
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Receiver location'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: screenAwareSize(50, context),
                decoration: BoxDecoration(
                    color: blackLiteColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: SvgPicture.asset(
                        AppAssets.weight,
                        height: screenAwareSize(40, context),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 15, bottom: 15, right: 10, left: 18),
                      child: VerticalDivider(
                        color: appBlack,
                        width: 4,
                      ),
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Approx weight'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Packaging',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: darkerPrimaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'What are you sending? ',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: blackLiteColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: screenAwareSize(50, context),
                decoration: BoxDecoration(
                    color: blackLiteColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Image.asset(
                        AppAssets.shipmentBox,
                        height: screenAwareSize(30, context),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                          top: 15, bottom: 15, right: 10, left: 18),
                      child: const VerticalDivider(
                        color: appBlack,
                        width: 4,
                      ),
                    ),
                    const Expanded(
                      child: TextField(
                        enabled: false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Box',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: blackLiteColor),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: darkerPrimaryColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'What are you sending? ',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: blackLiteColor),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: categories.map((category) {
                  final isSelected = category == selectedCategory;
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedCategory = isSelected ? '' : category;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                          color: blackLiteColor,
                          width: 1,
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      backgroundColor: isSelected ? Colors.black : Colors.white,
                      foregroundColor: isSelected ? Colors.white : Colors.black,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isSelected)
                          const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 13,
                          ),
                        if (isSelected)
                          SizedBox(
                            width: 3,
                          ),
                        Text(category),
                      ],
                    ),
                  );
                }).toList(),
              )
                  .animate()
                  .fadeIn(duration: 50.ms)
                  .slide(begin: const Offset(0, 1.0))
                  .animate()
                  .fadeIn(duration: 300.ms)
                  .slide(begin: const Offset(.1, 0.0)),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                onTap: () {
                  //animate().fadeIn(duration: 500.ms).slideY(begin: .0, end: .1);
                  Navigator.pushNamed(context, Routes.calculateSummary);
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.circular(40)),
                        child: Center(
                          child: Text(
                            'Calculate ',
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
          ).animate().fadeIn(duration: 500.ms).slideY(begin: .1, end: .0),
        ),
      ),
    );
  }
}
