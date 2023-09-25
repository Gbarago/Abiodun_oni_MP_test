import 'package:abiodun_mobile/data/product_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class ProductProvider extends ChangeNotifier {
//   final List<Product> products ;
//   final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

//   List<Product> get filteredProducts => List.from(products);

//   void filterProducts(String query) {
//     if (query.isNotEmpty) {
//       final lowerQuery = query.toLowerCase();
//       products.removeWhere((product) =>
//           !product.receiptNumber.toLowerCase().contains(lowerQuery));
//     }
//     notifyListeners();
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../data/product_data.dart';

// class ProductProvider extends ChangeNotifier {
//   final List<Product> products = productsList;
//   final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

// //  ProductProvider(this.products);

//   List<Product> get filteredProducts => List.from(products);

//   void filterProducts(String query) {
//     if (query.isNotEmpty) {
//       final lowerQuery = query.toLowerCase();
//       products.removeWhere((product) =>
//           !product.receiptNumber.toLowerCase().contains(lowerQuery));
//     }
//     notifyListeners();
//   }
// }
class ProductProvider extends ChangeNotifier {
  final List<Product> products;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  ProductProvider(this.products);

  List<Product> filteredProducts = []; // Initialize a filtered list

  void filterProducts(String query) {
    print('list isss ======  ${filteredProducts.length}');
    if (query.isNotEmpty) {
      final lowerQuery = query.toLowerCase();
      filteredProducts = products
          .where((product) =>
              product.receiptNumber.toLowerCase().contains(lowerQuery))
          .toList();
    } else {
      // If the query is empty, show all products
      filteredProducts = List.from(productsList);
      notifyListeners();
    }
    notifyListeners();
  }
}
