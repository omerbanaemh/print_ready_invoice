import 'package:print_ready_invoice/features/invoice/domin/entities/product_entity.dart';

class ProductModel {
  String prodactName;
  int quantity;
  double unitPrice;
  ProductModel({
    required this.prodactName,
    required this.quantity,
    required this.unitPrice,
  });

  factory ProductModel.fromProductEntity(ProductEntity productEntity) =>
      ProductModel(
        prodactName: productEntity.prodactName,
        quantity: productEntity.quantity,
        unitPrice: productEntity.unitPrice,
      );

  ProductEntity toProductEntity() => ProductEntity(
    prodactName: prodactName,
    quantity: quantity,
    unitPrice: unitPrice,
  );


  ProductModel copyWith({
    String? prodactName,
    int? quantity,
    double? unitPrice,
  }) {
    return ProductModel(
      prodactName: prodactName ?? this.prodactName,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
    );
  }
}
