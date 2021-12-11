import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/common/generated/l10n.dart';
import 'package:product_list/feature/domain/entities/product_entity.dart';
import 'package:product_list/feature/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:product_list/feature/presentation/pages/product_item.dart';
import 'package:product_list/feature/presentation/theme/constant.dart';
import 'package:product_list/feature/presentation/widgets/animated_widget.dart';
import 'package:product_list/feature/presentation/widgets/dissmissible_widget.dart';
import 'package:product_list/feature/presentation/widgets/message_empty_list.dart';

import 'product_view.dart';

class ProductListDonePage extends StatefulWidget {
  const ProductListDonePage({Key? key}) : super(key: key);

  @override
  _ProductListDonePageState createState() => _ProductListDonePageState();
}

class _ProductListDonePageState extends State<ProductListDonePage> {
  bool _openProductView = false;
  bool _isLoading = false;
  ProductEntity? _currentProduct;

  List<ProductEntity> _prroductList = [];

  @override
  Widget build(BuildContext context) {
    String changedTitle() {
      if (_currentProduct is ProductEntity && _openProductView) {
        return '${S.of(context).editing}: ${_currentProduct?.name}';
      } else if (_openProductView) {
        return S.of(context).create_new_product;
      }
      return S.of(context).product_list_done;
    }

    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductLoading) {
          setState(() {
            _isLoading = true;
          });
        }
        if (state is ProductGetListLoaded) {
          setState(() {
            _prroductList = state.list.where((e) => e.isDone is bool).toList();
            _isLoading = false;
          });
        }
        if (state is ProductCreated) {
          setState(() {
            _openProductView = false;
            _prroductList.add(state.entity);
            _isLoading = false;
          });
        }
        if (state is ProductChanged) {
          setState(() {
            _openProductView = false;
            _prroductList = _prroductList.map((e) {
              if (e.id == state.entity.id) {
                return state.entity;
              }
              return e;
            }).toList();

            BlocProvider.of<ProductBloc>(context).add(
              ProductGetList(),
            );
          });
        }

        if (state is ProductDeleted) {
          setState(() {
            _isLoading = false;
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(changedTitle(),
              style: Theme.of(context).textTheme.headline1),
          actions: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: animatedSwitcherScaleTransition,
              child: _openProductView
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _currentProduct = null;
                          _openProductView = !_openProductView;
                        });
                      },
                      icon: const Icon(Icons.close),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
        body: Stack(
          fit: _openProductView ? StackFit.expand : StackFit.loose,
          children: [
            Container(
              decoration: boxDecoration,
            ),
            RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<ProductBloc>(context).add(
                  ProductGetList(),
                );
              },
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: _prroductList.length,
                itemBuilder: (context, i) {
                  var product = _prroductList[i];
                  return DissmissibleWidget(
                    key: ValueKey<int>(_prroductList[i].id ?? 1),
                    colorLeft: Colors.blue,
                    iconLeft: const Icon(
                      Icons.assignment_return_outlined,
                      size: 40,
                      color: Colors.white,
                    ),
                    onDismissed: (DismissDirection direction) {
                      if (direction == DismissDirection.startToEnd) {
                        BlocProvider.of<ProductBloc>(context).add(
                          ProductChange(
                            product.changeStatus(),
                          ),
                        );
                      } else {
                        BlocProvider.of<ProductBloc>(context).add(
                          ProductDelete(product),
                        );
                      }
                      setState(() {
                        _prroductList.removeAt(i);
                      });
                    },
                    item: _prroductList,
                    child: ProductItem(
                      product: product,
                      onTap: () {
                        setState(() {
                          _openProductView = true;
                          _currentProduct = product;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: animatedSwitcherSlideTransition,
              child: _openProductView
                  ? ProductView(entity: _currentProduct)
                  : const SizedBox.shrink(),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: animatedSwitcherScaleTransition,
              child: _prroductList.isEmpty
                  ? MessageEmptyList(
                      S.of(context).so_far_nothing_has_been_done,
                    )
                  : const SizedBox.shrink(),
            ),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
