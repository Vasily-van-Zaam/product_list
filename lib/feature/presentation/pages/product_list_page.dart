import 'package:flutter/material.dart';
import 'package:product_list/common/generated/l10n.dart';
import 'package:product_list/feature/presentation/widgets/dissmissible_widget.dart';

import 'product_page.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  bool _openProductView = false;
  List list = List.generate(100, (i) => i);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: ,
          title: Text(S.of(context).product_list),
          actions: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: _openProductView
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _openProductView = !_openProductView;
                        });
                      },
                      icon: const Icon(Icons.close))
                  : const SizedBox.shrink(),
            ),
          ],
        ),
        body: Stack(
          fit: _openProductView ? StackFit.expand : StackFit.loose,
          children: [
            ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, i) {
                  return DissmissibleWidget(
                    key: ValueKey<int>(list[i]),
                    onDismissed: (DismissDirection direction) {
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
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: _openProductView ? ProductPage() : const SizedBox.shrink(),
            )
          ],
        ),
        floatingActionButton: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: !_openProductView
              ? FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      _openProductView = !_openProductView;
                    });
                  },
                  child: const Icon(Icons.add),
                )
              : const SizedBox.shrink(),
        ));
  }
}
