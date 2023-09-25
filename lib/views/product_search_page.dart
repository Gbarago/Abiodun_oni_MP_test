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
import 'package:abiodun_mobile/providers/product_peovider.dart';
import 'package:abiodun_mobile/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductSearchPage extends StatefulWidget {
  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: Text('Search Products'),
        flexibleSpace: Container(
            margin: EdgeInsets.only(top: 60, bottom: 40),
            child: AppBarSearchWidget(isEnabled: true)),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, productProvider, _) {
          print('product length: ${productProvider.products.length}');
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _searchController,
                  onChanged: (query) {
                    productProvider.filterProducts(query);
                  },
                  decoration: InputDecoration(
                    labelText: 'Search by Receipt Number',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Expanded(
                child: AnimatedList(
                  key: productProvider.listKey,
                  initialItemCount: productProvider.products.length,
                  itemBuilder: (context, index, animation) {
                    final product = productProvider.products[index];
                    return buildProductItem(product, animation);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildProductItem(Product product, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        title: Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.senderAddress,
            ),
            Text(product.receiverAddress),
            const Icon(Icons.arrow_forward),
            Text(product.receiptNumber),
          ],
        ),
        leading: Icon(Icons.shopping_cart),
        onTap: () {
          // Handle product selection here
        },
      ),
    );
  }
}
