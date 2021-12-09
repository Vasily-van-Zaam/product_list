import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    Key? key,
  }) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
              // bottomRight: Radius.circular(40),
              // bottomLeft: Radius.circular(40),
            ),
          ),
        ),
        SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Center(
                child: Text('Hello'),
              )
            ],
          ),
        ),
      ],
    );
  }
}
