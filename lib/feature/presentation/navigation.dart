import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/common/generated/l10n.dart';

import 'bloc/product_bloc/product_bloc.dart';
import 'pages/product_list_done_page.dart';
import 'pages/product_list_page.dart';

import 'pages/setting_page.dart';
import 'theme/constant.dart';

class Navigtion extends StatefulWidget {
  final int indexNav;
  const Navigtion({Key? key, this.indexNav = 0}) : super(key: key);

  @override
  _NavigtionState createState() => _NavigtionState();
}

class _NavigtionState extends State<Navigtion> {
  late int _currentIndex = widget.indexNav;
  int _countNew = 0;
  int _countDone = 0;

  final List<Widget> _listPages = const [
    ProductListPage(),
    ProductListDonePage(),
    SettingPage(),
  ];

  List<BottomNavigationBarItem> itemsButton(context) => [
        BottomNavigationBarItem(
          icon: setBadge(
            _countNew,
            const Icon(Icons.list_alt, size: 23),
          ),
          label: S.of(context).list,
          activeIcon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: buttonBoxShadow,
            ),
            child: setBadge(
                _countNew, const Icon(Icons.list_alt_sharp, size: 30),
                isShow: false),
          ),
        ),
        BottomNavigationBarItem(
          icon: setBadge(
            _countDone,
            const Icon(Icons.fact_check_outlined, size: 23),
          ),
          label: S.of(context).done,
          activeIcon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: buttonBoxShadow,
            ),
            child: setBadge(
                _countDone, const Icon(Icons.fact_check_outlined, size: 30),
                isShow: false),
          ),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings, size: 23),
          activeIcon: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: buttonBoxShadow,
            ),
            child: const Icon(Icons.settings, size: 30),
          ),
          label: S.of(context).settings,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: lightGradientBackgroundScaffold,
      ),
      child: BlocListener<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductGetListLoaded) {
            var countNew = state.list.where((e) => e.isDone == null).length;
            var countDone = state.list.where((e) => e.isDone is bool).length;
            setState(() {
              _countNew = countNew;
              _countDone = countDone;
            });
          }
        },
        child: Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: _listPages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedFontSize: 16,
            selectedFontSize: 18,
            currentIndex: _currentIndex,
            onTap: onTabTapped,
            items: itemsButton(context),
          ),
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

Widget setBadge(int count, Icon icon, {bool isShow = true}) {
  return Badge(
    badgeContent: Text('$count'),
    showBadge: count != 0 && isShow,
    child: icon,
  );
}
