class CartItemModel {
  final String id;
  final String title;
  final String image;
  final int price;
  int quantity;

  CartItemModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    this.quantity = 1,
  });
}
