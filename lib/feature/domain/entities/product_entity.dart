import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String name;
  final double price;
  final bool? isDone;
  final double quantity;
  final String quantityType;
  final String? description;
  final int? positionIndex;

  const ProductEntity({
    this.id,
    required this.name,
    this.price = 0,
    this.isDone,
    this.description = '',
    this.quantity = 1.0,
    this.quantityType = 'pieces',
    this.positionIndex,
  });

  ProductEntity changeStatus([bool? status]) {
    return ProductEntity(
        id: id,
        name: name,
        price: price,
        isDone: status,
        description: description,
        quantity: quantity,
        quantityType: quantityType,
        positionIndex: positionIndex);
  }

  double get summ => price * quantity;

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        isDone,
        description,
        quantity,
        quantityType,
      ];
}
