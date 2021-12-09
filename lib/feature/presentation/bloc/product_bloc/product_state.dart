part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductError extends ProductState {
  final String message;
  final int status;

  const ProductError(this.message, this.status);
  @override
  List<Object> get props => [];
}

class ProductGetListLoaded extends ProductState {
  final List<ProductEntity> list;

  const ProductGetListLoaded(this.list);
  @override
  List<Object> get props => [list];
}

class ProductCreated extends ProductState {
  final ProductEntity entity;

  const ProductCreated(this.entity);
  @override
  List<Object> get props => [entity];
}

class ProductDeleted extends ProductState {}

class ProductAllDeleted extends ProductState {}

class ProductChanged extends ProductState {}
