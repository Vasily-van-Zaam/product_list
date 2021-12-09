import 'package:product_list/feature/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {int? id,
      String name = '',
      bool? isDone,
      String? description,
      double price = 0.0,
      double quantity = 0.0,
      String quantityType = 'pieces'})
      : super(
            name: name,
            id: id,
            isDone: isDone,
            price: price,
            description: '',
            quantity: 0.0,
            quantityType: quantityType);

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      name: json["name"],
      isDone: json["is_done"],
      price: json["price"],
      description: json["description"],
      quantity: json["quantity"],
      quantityType: json["quantity+type"],
    );
  }

  Map<String, dynamic> get toJson => {
        "id": id,
        "name": name,
        "is_done": isDone,
        "price": price,
        "description": description,
        "quantity": quantity,
        "quantity_type": quantityType,
      };
}
