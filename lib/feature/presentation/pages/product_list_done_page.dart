import 'package:flutter/material.dart';
import 'package:product_list/common/generated/l10n.dart';
import 'package:product_list/feature/presentation/widgets/dissmissible_widget.dart';

class ProductListDonePage extends StatefulWidget {
  const ProductListDonePage({Key? key}) : super(key: key);

  @override
  _ProductListDonePageState createState() => _ProductListDonePageState();
}

class _ProductListDonePageState extends State<ProductListDonePage> {
  List list = List.generate(100, (i) => i);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: ,
        title: Text(S.of(context).product_list),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) {
            return DissmissibleWidget(
              key: ValueKey<int>(list[i]),
              onDismissed: (DismissDirection direction) {
                print(direction);
                setState(() {
                  list.removeAt(i);
                });
              },
              item: list,
              child: ListTile(
                title: Text(
                  'Item ${list[i]}',
                ),
              ),
            );
          }),
    );
  }
}
