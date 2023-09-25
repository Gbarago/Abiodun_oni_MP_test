// import 'package:abiodun_mobile/data/product_data.dart';
// import 'package:abiodun_mobile/providers/product_peovider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ProductSearchPage extends StatefulWidget {
//   @override
//   _ProductSearchPageState createState() => _ProductSearchPageState();
// }

// class _ProductSearchPageState extends State<ProductSearchPage> {
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context);

//     print('product lenght jjjj oooo ${productProvider.products.length}');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Search Products'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (query) {
//                 productProvider.filterProducts(query);
//               },
//               decoration: InputDecoration(
//                 labelText: 'Search by Receipt Number',
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           Expanded(
//             child: AnimatedList(
//               key: productProvider.listKey,
//               initialItemCount: productProvider.filteredProducts.length,
//               itemBuilder: (context, index, animation) {
//                 final product = productProvider.filteredProducts[index];
//                 return buildProductItem(product, animation);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildProductItem(Product product, Animation<double> animation) {
//     return SizeTransition(
//       sizeFactor: animation,
//       child: ListTile(
//         title: Text(product.name),
//         subtitle: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(product.senderAddress),
//             Text(product.receiverAddress),
//             Text(product.receiptNumber),
//           ],
//         ),
//         leading: Icon(Icons.shopping_cart),
//         trailing: Icon(Icons.arrow_forward),
//         onTap: () {
//           // Handle product selection here
//         },
//       ),
//     );
//   }
// }
import 'package:abiodun_mobile/data/product_data.dart';
import 'package:abiodun_mobile/helper/utils/assets.dart';
import 'package:abiodun_mobile/helper/utils/colors.dart';
import 'package:abiodun_mobile/providers/product_peovider.dart';
import 'package:abiodun_mobile/views/home_screen.dart';
import 'package:flutter/material.dart';
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
    print(
        ' filtered kfk ok fpoksp  ${productProvider.filteredProducts.length}');
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
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
          body: Consumer<ProductProvider>(
            builder: (context, productProvider, _) {
              return Column(
                children: [
                  // Expanded(
                  //   child: AnimatedList(
                  //     key: productProvider.listKey,
                  //     initialItemCount: productProvider.products.length,
                  //     itemBuilder: (context, index, animation) {
                  //       final filteredProd = productProvider.filteredProducts;
                  //       final filteredProduct =
                  //           productProvider.filteredProducts[index] ;
                  //       final allProduct =
                  //           productProvider.filteredProducts[index];

                  //       return buildProductItem(
                  //           filteredProd.length > 0
                  //               ? filteredProduct
                  //               : allProduct,
                  //           animation);
                  //     },
                  //   ),
                  // ),

                  Expanded(
                    child: AnimatedList(
                      key: productProvider.listKey,
                      initialItemCount: _searchController.text.isNotEmpty
                          ? productProvider.filteredProducts.length
                          : productProvider.products.length,
                      itemBuilder: (context, index, animation) {
                        final filteredProducts =
                            productProvider.filteredProducts;
                        final allProducts = productProvider.products;

                        final product = _searchController.text.isNotEmpty
                            ? filteredProducts.isNotEmpty
                                ? filteredProducts[index]
                                : allProducts[index]
                            : allProducts[index];

                        return buildProductItem(product, animation);
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildProductItem(Product product, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
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
          onTap: () {
            // Handle product selection here
          },
        ),
      ),
    );
  }
}
