import 'package:flutter/material.dart';
import 'package:product_list/feature/presentation/theme/constant.dart';

class MyTextButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  const MyTextButton({Key? key, this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.circular(20),
        boxShadow: buttonBoxShadow,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class MyIconButton extends StatelessWidget {
  final Function()? onPressed;
  final Icon icon;
  const MyIconButton({Key? key, this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.red,
        borderRadius: BorderRadius.circular(20),
        boxShadow: buttonBoxShadow,
      ),
      child: TextButton.icon(
        onPressed: () {},
        icon: icon,
        label: Text(''),
      ),
    );
  }
}

class MyCheckBoxButton extends StatelessWidget {
  final Function()? onChange;
  final bool value;
  final String title;
  const MyCheckBoxButton(
      {Key? key, this.onChange, required this.value, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: null,
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: onChange,
            icon: Icon(
                value
                    ? Icons.check_circle_outline
                    : Icons.radio_button_unchecked,
                size: 20,
                color: value
                    ? null
                    : Theme.of(context).textTheme.headline2?.color),
            label: Text(title, style: Theme.of(context).textTheme.headline1),
            style: ElevatedButton.styleFrom(
              // padding: paddingChexBoxButton,
              primary:
                  value ? null : Theme.of(context).colorScheme.onBackground,
            ),
          )
        ],
      ),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  final Function()? onPressed;
  final Icon icon;
  const MyFloatingActionButton({Key? key, this.onPressed, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: buttonBoxShadow,
        ),
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: onPressed,
          child: icon,
        ));
  }
}
