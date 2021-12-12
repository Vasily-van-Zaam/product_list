import 'package:flutter/material.dart';
import 'package:product_list/common/generated/l10n.dart';
import 'package:product_list/feature/domain/entities/product_entity.dart';
import 'package:product_list/feature/presentation/theme/constant.dart';

class ProductItem extends StatelessWidget {
  final Function()? onTap;
  final ProductEntity product;
  const ProductItem({Key? key, this.onTap, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currency =
        S.of(context).lang == 'ru' ? S.of(context).rub : S.of(context).dollar;
    var description = product.description;
    return Container(
      // padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: boxDecorationItemList,
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          onTap: onTap,
          leading: getStatusProduct(product.isDone),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      '${product.quantity.toInt()}  ${selectPrefixString(context, product.quantityType)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '${S.of(context).total}: ${product.summ.toInt()} $currency',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '${product.price.toInt()} $currency/${selectPrefixString(context, product.quantityType)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              description is String && description.isNotEmpty
                  ? Text(
                      description,
                      style: const TextStyle(
                          fontSize: 14, fontStyle: FontStyle.italic),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget emoji(String emoji) => RichText(
      text: TextSpan(
        text: emoji,
        style: const TextStyle(fontSize: 40),
      ),
    );

Widget getStatusProduct(bool? status) {
  return status == null
      ? emoji('💥')
      : status == true
          ? emoji('✅')
          : emoji('🚫');
}

String selectPrefixString(
  BuildContext context,
  String characterStr,
) {
  String v = S.of(context).pieces;
  switch (characterStr) {
    case 'liters':
      v = S.of(context).liters;
      break;
    case 'gram':
      v = S.of(context).gram;
      break;
    case 'kgram':
      v = S.of(context).kgram;
      break;
    default:
      v = S.of(context).pieces;
  }
  return v;
}
