import 'dart:convert';

import 'package:product_list/core/error.dart';
import 'package:product_list/feature/data/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TooltipLocalStorageDataSource {
  Future<List<TooltipModel>> getList({String? search, int? limit});
  Future<bool> create(TooltipModel model);
  Future<bool> delete(TooltipModel model);
}

const tooltipListKey = 'tooltips';

class TooltipLocalStorageDataSourceImpl
    implements TooltipLocalStorageDataSource {
  final SharedPreferences sharedPreferences;

  TooltipLocalStorageDataSourceImpl(this.sharedPreferences);
  @override
  Future<bool> create(TooltipModel model) async {
    try {
      var strList = sharedPreferences.getStringList(tooltipListKey) ?? [];
      Set<String> setList = strList.toSet();
      model.toJson["name"] = model.toJson["name"]?.trim();
      setList.add(jsonEncode(model.toJson));

      return await sharedPreferences.setStringList(
          tooltipListKey, setList.toList());
    } catch (err) {
      throw const FailureResponse('LOCAL_ERROR', 500);
    }
  }

  @override
  Future<bool> delete(TooltipModel model) async {
    try {
      var strList = sharedPreferences.getStringList(tooltipListKey) ?? [];
      strList.remove(model.name.trim());
      return await sharedPreferences.setStringList(tooltipListKey, strList);
    } catch (err) {
      throw const FailureResponse('LOCAL_ERROR', 500);
    }
  }

  @override
  Future<List<TooltipModel>> getList({String? search = '', int? limit}) async {
    try {
      var strList = sharedPreferences.getStringList(tooltipListKey) ?? [];
      List<TooltipModel> list = [];
      for (var i = 0; i < strList.length; i++) {
        list.add(
          TooltipModel(
            id: i,
            name: strList[i],
          ),
        );
      }
      return list
          .where((e) => e.name.toLowerCase().contains(search!.toLowerCase()))
          .toList();
    } catch (err) {
      throw const FailureResponse('LOCAL_ERROR', 500);
    }
  }
}
