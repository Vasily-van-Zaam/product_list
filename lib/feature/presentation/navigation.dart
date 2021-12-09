import 'package:flutter/material.dart';
import 'package:product_list/common/generated/l10n.dart';

import 'pages/product_list_done_page.dart';
import 'pages/product_list_page.dart';

import 'theme/constant.dart';

class Navigtion extends StatefulWidget {
  const Navigtion({Key? key}) : super(key: key);

  @override
  _NavigtionState createState() => _NavigtionState();
}

class _NavigtionState extends State<Navigtion> {
  int _currentIndex = 0;

  final List<Widget> _listPages = [
    ProductListPage(),
    ProductListDonePage(),
    Text('dsd'),
  ];

  List<BottomNavigationBarItem> itemsButton(context) => [
        BottomNavigationBarItem(
          icon: const Icon(Icons.list_alt, size: 28),
          label: S.of(context).list,
          activeIcon: const Icon(Icons.list_alt_sharp, size: 40),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.fact_check_outlined, size: 28),
          label: S.of(context).done,
          activeIcon: const Icon(Icons.fact_check_outlined, size: 40),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings, size: 28),
          activeIcon: const Icon(Icons.settings, size: 40),
          label: S.of(context).settings,
        ),
        // BottomNavigationBarItem(
        //   icon: const Icon(Icons.shopping_cart, size: 28),
        //   activeIcon: const Icon(Icons.shopping_cart, size: 28),
        //   label: S.of(context).basket,
        // ),
        // BottomNavigationBarItem(
        //   icon: const Icon(Icons.login, size: 28),
        //   activeIcon: const Icon(Icons.login, size: 28),
        //   label: S.of(context).login,
        // )
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: lightGradientBackgroundScaffold,
      ),
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _listPages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedFontSize: 16,
          selectedFontSize: 18,
          // selectedItemColor: Theme.of(context).colorScheme.onPrimary,
          // unselectedItemColor: Theme.of(context).colorScheme.onBackground,
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: itemsButton(context),
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
