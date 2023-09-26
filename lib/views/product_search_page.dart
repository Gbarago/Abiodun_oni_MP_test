import 'package:abiodun_mobile/data/product_data.dart';
import 'package:abiodun_mobile/helper/utils/assets.dart';
import 'package:abiodun_mobile/helper/utils/colors.dart';
import 'package:abiodun_mobile/providers/nav_provider.dart';
import 'package:abiodun_mobile/providers/product_peovider.dart';
import 'package:abiodun_mobile/routes.dart';
import 'package:abiodun_mobile/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProductSearchPage extends StatefulWidget {
  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final tabProvider = Provider.of<TabProvider>(context, listen: false);

    print(
        ' filtered kfk ok fpoksp  ${productProvider.filteredProducts.length}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        // foregroundColor: primaryColor,
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  tabProvider.setPageIndex(0);

                  Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.dashboard, (route) => false);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: AppBarSearchWidget(
                isEnabled: true,
                searchController: _searchController,
                onChanged: (query) {
                  productProvider.filterProducts(query);
                },
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Consumer<ProductProvider>(
          builder: (context, productProvider, _) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _searchController.text.isNotEmpty
                        ? productProvider.filteredProducts.length
                        : productProvider.products.length,
                    itemBuilder: (context, index) {
                      final filteredProducts = productProvider.filteredProducts;
                      final allProducts = productProvider.products;

                      final product = _searchController.text.isNotEmpty
                          ? filteredProducts.isNotEmpty
                              ? filteredProducts[index]
                              : allProducts[index]
                          : allProducts[index];

                      return buildProductItem(product)
                          .animate()
                          .fadeIn(duration: 500.ms)
                          .slideY(begin: .1, end: .0);
                    },
                  )
                      .animate()
                      .fadeIn(duration: 500.ms)
                      .slideY(begin: .1, end: .0),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildProductItem(
    Product product,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        title: Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              product.receiptNumber,
              style: const TextStyle(fontSize: 12),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: blackLiteColor,
              ),
            ),
            Text(
              product.senderAddress,
            ),
            const Icon(
              Icons.arrow_forward,
              size: 10,
            ),
            Text(
              product.receiverAddress,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        leading: CircleAvatar(
            backgroundColor: primaryColor,
            child: SvgPicture.asset(
              AppAssets.box,
              color: Colors.white,
            )),
        onTap: () {},
      ),
    );
  }
}
