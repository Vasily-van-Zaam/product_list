import 'package:product_list/feature/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    int? id,
    String name = '',
    bool? isDone,
    String? description,
    double price = 0.0,
    double quantity = 0.0,
    String quantityType = 'pieces',
    int? positionIndex,
  }) : super(
          name: name,
          id: id,
          isDone: isDone,
          price: price,
          description: description,
          quantity: quantity,
          quantityType: quantityType,
          positionIndex: positionIndex,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      name: json["name"] is String ? json["name"].trim() : '',
      isDone: json["is_done"],
      price: json["price"],
      description:
          json["description"] is String ? json["description"].trim() : '',
      quantity: json["quantity"],
      quantityType: json["quantity_type"],
      positionIndex: json["position_idex"],
    );
  }

  ProductEntity toEntity() => ProductEntity(
        id: id,
        name: name,
        quantity: quantity,
        quantityType: quantityType,
        price: price,
        positionIndex: positionIndex,
        isDone: isDone,
        description: description,
      );

  Map<String, dynamic> get toJson => {
        "id": id,
        "name": name,
        "is_done": isDone,
        "price": price,
        "description": description,
        "quantity": quantity,
        "quantity_type": quantityType,
        "position_index": positionIndex
      };
}
