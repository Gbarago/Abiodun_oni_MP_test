class Product {
  final String name;
  final String senderAddress;
  final String receiverAddress;
  final String receiptNumber;

  Product({
    required this.name,
    required this.senderAddress,
    required this.receiverAddress,
    required this.receiptNumber,
  });
}

final List<Product> productsList = [
  Product(
    name: 'iPhone 12 Pro',
    senderAddress: 'New York',
    receiverAddress: 'Paris',
    receiptNumber: '#NEJ1234567890',
  ),
  Product(
    name: 'Samsung Galaxy S21',
    senderAddress: 'Los Angeles',
    receiverAddress: 'London',
    receiptNumber: '#NEJ2345678901',
  ),
  Product(
    name: 'MacBook Pro',
    senderAddress: 'Paris',
    receiverAddress: 'Madrid',
    receiptNumber: '#NEJ3456789012',
  ),
  Product(
    name: 'Designer Jeans',
    senderAddress: 'Berlin',
    receiverAddress: 'Rome',
    receiptNumber: '#NEJ4567890123',
  ),
  Product(
    name: 'Summer Dress',
    senderAddress: 'Tokyo, Japan',
    receiverAddress: 'Seoul',
    receiptNumber: '#NEJ5678901234',
  ),
  Product(
    name: 'Samsung 4K TV',
    senderAddress: 'Lagos, ',
    receiverAddress: 'Accra',
    receiptNumber: '#NEJ6789012345',
  ),
  // Product(
  //   name: 'Leather Handbag',
  //   senderAddress: 'Sydney, Australia',
  //   receiverAddress: 'Auckland, ',
  //   receiptNumber: '#NEJ7890123456',
  // ),
  // Product(
  //   name: 'Smartwatch',
  //   senderAddress: 'Moscow',
  //   receiverAddress: 'Beijing',
  //   receiptNumber: '#NEJ8901234567',
  // ),
];
