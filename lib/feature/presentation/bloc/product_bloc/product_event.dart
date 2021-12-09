part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductGetList extends ProductEvent {}

class ProductCreate extends ProductEvent {
  final ProductEntity entity;

  const ProductCreate(this.entity);

  @override
  List<Object> get props => [entity];
}

class ProductChange extends ProductEvent {
  final ProductEntity entity;

  const ProductChange(this.entity);

  @override
  List<Object> get props => [entity];
}

class ProductDelete extends ProductEvent {
  final ProductEntity entity;

  const ProductDelete(this.entity);

  @override
  List<Object> get props => [entity];
}

class ProductAllDelete extends ProductEvent {}
