import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int? id;
  final String name;
  final double price;
  final bool? isDone;
  final double quantity;
  final String quantityType;
  final String description;

  const ProductEntity({
    this.id,
    required this.name,
    this.price = 0,
    this.isDone = false,
    this.description = '',
    this.quantity = 1.0,
    this.quantityType = 'pieces',
  });

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        isDone,
        description,
      ];
}
