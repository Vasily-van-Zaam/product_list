import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_list/feature/domain/entities/product_entity.dart';
import 'package:product_list/feature/domain/use_cases/product_case/product_cases.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductCases productCases;
  ProductBloc(this.productCases) : super(ProductInitial()) {
    on<ProductGetList>(_getList);
    on<ProductCreate>(_create);

    on<ProductChange>(_change);
    on<ProductDelete>(_delete);
    on<ProductAllDelete>(_allDelete);
  }

  FutureOr<void> _getList(
      ProductGetList event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    var res = await productCases.getList();
    emit(
      res.fold(
        (l) => ProductError(l.message, l.status),
        (r) => ProductGetListLoaded(r),
      ),
    );
  }

  FutureOr<void> _create(
      ProductCreate event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    var res = await productCases.create(event.entity);
    emit(
      res.fold(
        (l) => ProductError(l.message, l.status),
        (r) => ProductCreated(r),
      ),
    );
  }

  FutureOr<void> _change(
      ProductChange event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    var res = await productCases.change(event.entity);
    emit(
      res.fold(
        (l) => ProductError(l.message, l.status),
        (r) => ProductChanged(r),
      ),
    );
  }

  FutureOr<void> _delete(
      ProductDelete event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    var res = await productCases.delete(event.entity);
    emit(
      res.fold(
        (l) => ProductError(l.message, l.status),
        (r) => ProductDeleted(r),
      ),
    );
  }

  FutureOr<void> _allDelete(
      ProductAllDelete event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    var res = await productCases.deleteAll();
    emit(
      res.fold(
        (l) => ProductError(l.message, l.status),
        (r) => ProductAllDeleted(),
      ),
    );
  }
}
