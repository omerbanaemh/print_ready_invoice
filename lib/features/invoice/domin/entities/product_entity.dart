class ProductEntity {
  String prodactName;
  int quantity;
  double unitPrice;
  ProductEntity({
    required this.prodactName,
    required this.quantity,
    required this.unitPrice,
  });
}

extension ProductsModelFunctions on ProductEntity {
  num total() => unitPrice * quantity;
}

extension ListProductsModelFunctions on List<ProductEntity> {
  ({num total, num subtotal, num tax}) calculate() {
    num subtotal = 0;
    for (var product in this) {
      subtotal += product.total();
    }
    num tax = subtotal * 0.08;
    num total = subtotal + tax;
    return (total: total, subtotal: subtotal, tax: tax);
  }
}

