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
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: boxDecorationItemList,
      child: Material(
        color: Colors.transparent,
        child: ListTile(
          onTap: onTap,
          leading: getStatusProduct(product.isDone),
          trailing: SizedBox(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${product.summ.toInt()} \$'),
                Text(
                  '${product.price.toInt()} \$/${selectPrefixString(context, product.quantityType)}',
                ),
              ],
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
              ),
              Text(
                '${product.quantity.toInt()}  ${selectPrefixString(context, product.quantityType)}',
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                product.description ?? "",
                style: const TextStyle(fontSize: 14),
              )
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
