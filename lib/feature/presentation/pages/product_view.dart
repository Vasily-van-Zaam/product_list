import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/common/generated/l10n.dart';
import 'package:product_list/feature/domain/entities/product_entity.dart';
import 'package:product_list/feature/domain/entities/tooltip_entity.dart';
import 'package:product_list/feature/domain/use_cases/tooltip_case/tooltip_cases.dart';

import 'package:product_list/feature/presentation/bloc/product_bloc/product_bloc.dart';
import 'package:product_list/feature/presentation/bloc/tooltip_cubit/tooltip_cubit.dart';
import 'package:product_list/feature/presentation/widgets/animated_widget.dart';
import 'package:product_list/feature/presentation/widgets/buttons.dart';
import 'package:product_list/feature/presentation/widgets/inputs.dart';

enum SingingCharacter { pieces, liters, gram, kgram }

class ProductView extends StatefulWidget {
  final ProductEntity? entity;
  const ProductView({
    Key? key,
    this.entity,
  }) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  ProductEntity? _entity;
  SingingCharacter? _character = SingingCharacter.pieces;
  String _name = '';
  double? _price;
  double? _quantity;
  String? _quantityType;
  String? _description;

  @override
  void initState() {
    super.initState();
    _entity = widget.entity;
    _name = widget.entity?.name ?? '';
    _price = widget.entity?.price;
    _quantity = widget.entity?.quantity;
    _quantityType = widget.entity?.quantityType;
    _description = widget.entity?.description;
    _quantityController.text = _quantity is double ? _quantity.toString() : '';
    _priceController.text = _price is double ? _price.toString() : '';
    _descriptionController.text = _description ?? "";

    switch (_quantityType) {
      case 'liters':
        _character = SingingCharacter.liters;
        break;
      case 'gram':
        _character = SingingCharacter.gram;
        break;
      case 'kgram':
        _character = SingingCharacter.kgram;
        break;
      default:
        _character = SingingCharacter.pieces;
    }
  }

  List<String> _tooltipListStr = [];
  @override
  Widget build(BuildContext context) {
    ProductEntity newEntity = ProductEntity(
        id: widget.entity?.id,
        name: _name,
        description: _description,
        price: _price ?? 0,
        quantity: _quantity ?? 0,
        quantityType: _quantityType ?? 'pieces');

    return BlocListener<TooltipCubit, TooltipState>(
      listener: (context, state) {
        if (state is ToolyipListLoaded) {
          _tooltipListStr = state.list.map((e) => e.name).toList();
        }
      },
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  children: [
                    Center(
                      child: _entity is ProductEntity
                          ? Text(_entity!.name)
                          : Text(S.of(context).new_product),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyAutocomplete(
                        initialValue: _name,
                        label: Text('${S.of(context).name} *'),
                        onRemoveElementOption: (String v) {
                          setState(() {
                            _tooltipListStr.remove(v);
                          });
                          BlocProvider.of<TooltipCubit>(context)
                              .delete(TooltipEntity(name: v));
                        },
                        onSelected: (v) {
                          setState(() {
                            _name = v;
                          });
                        },
                        onChange: (v) {
                          setState(() {
                            _name = v;
                          });
                        },
                        optionsBuilder: (TextEditingValue textEditingValue) {
                          if (textEditingValue.text.length > 1) {
                            BlocProvider.of<TooltipCubit>(context)
                                .getList(GetListParams(textEditingValue.text));
                            return _tooltipListStr.where(
                              (e) => e.toLowerCase().contains(
                                  textEditingValue.text.toLowerCase()),
                            );
                          } else {
                            return [];
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _descriptionController,
                        onChanged: (v) {
                          setState(() {
                            _description = v;
                          });
                        },
                        decoration: InputDecoration(
                          label: Text(S.of(context).description),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyTextFieldTwoInOne(
                        controllerLeft: _quantityController,
                        controllerRight: _priceController,
                        sufix: setSufixOrPrefix('\$'),
                        prefix: selectPrefix(
                            context: context, character: _character),
                        onChangedRight: (v) {
                          setState(() {
                            try {
                              _price = double.parse(v);
                              // ignore: empty_catches
                            } catch (e) {}
                          });
                        },
                        onChangedLeft: (v) {
                          setState(() {
                            try {
                              _quantity = double.parse(v);
                              // ignore: empty_catches
                            } catch (e) {}
                          });
                        },
                        keyboardTypeLeft: TextInputType.number,
                        keyboardTypeRight: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio<SingingCharacter>(
                              value: SingingCharacter.pieces,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _quantityType = value
                                      .toString()
                                      .replaceAll('SingingCharacter.', '');
                                  _character = value;
                                });
                              },
                            ),
                            Text(S.of(context).pieces),
                            Radio<SingingCharacter>(
                              value: SingingCharacter.liters,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _quantityType = value
                                      .toString()
                                      .replaceAll('SingingCharacter.', '');
                                  _character = value;
                                });
                              },
                            ),
                            Text(S.of(context).liters),
                            Radio<SingingCharacter>(
                              value: SingingCharacter.gram,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _quantityType = value
                                      .toString()
                                      .replaceAll('SingingCharacter.', '');
                                  _character = value;
                                });
                              },
                            ),
                            Text(S.of(context).gram),
                            Radio<SingingCharacter>(
                              value: SingingCharacter.kgram,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _quantityType = value
                                      .toString()
                                      .replaceAll('SingingCharacter.', '');
                                  _character = value;
                                });
                              },
                            ),
                            Text(S.of(context).kgram),
                          ],
                        ),
                      ),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder: animatedSwitcherScaleTransition,
                      child: _name.isNotEmpty && _entity != newEntity
                          ? MyTextButton(
                              title: S.of(context).save,
                              onPressed: () {
                                BlocProvider.of<TooltipCubit>(context).create(
                                    TooltipEntity(name: newEntity.name));
                                if (_entity is ProductEntity) {
                                  BlocProvider.of<ProductBloc>(context)
                                      .add(ProductChange(newEntity));
                                  return;
                                }

                                BlocProvider.of<ProductBloc>(context)
                                    .add(ProductCreate(newEntity));
                              },
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget setSufixOrPrefix(String v) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(v),
    );

Widget selectPrefix({
  required BuildContext context,
  SingingCharacter? character = SingingCharacter.pieces,
}) {
  String v = S.of(context).pieces;
  switch (character) {
    case SingingCharacter.liters:
      v = S.of(context).liters;
      break;
    case SingingCharacter.gram:
      v = S.of(context).gram;
      break;
    case SingingCharacter.kgram:
      v = S.of(context).kgram;
      break;
    default:
      v = S.of(context).pieces;
  }
  return setSufixOrPrefix(v);
}
