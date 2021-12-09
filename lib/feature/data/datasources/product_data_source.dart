import 'dart:convert';

import 'package:product_list/core/error.dart';
import 'package:product_list/feature/data/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalStorageDataSource {
  Future<List<ProductModel>> list();
  Future<bool> create(ProductModel product);
  Future<bool> delete(ProductModel product);
  Future<bool> change(ProductModel product);
  Future<bool> delleteAllProducts();
  Future<bool> cleanData();
}

const prefixProductKey = 'product_';

class ProductLocalStorageDataSourceImpl
    implements ProductLocalStorageDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalStorageDataSourceImpl(this.sharedPreferences);
  @override
  Future<bool> change(ProductModel product) async {
    try {
      return await sharedPreferences.setString(
        '$prefixProductKey${product.id}',
        jsonEncode(product.toJson),
      );
    } catch (err) {
      throw const FailureResponse('LOCAL_ERROR', 500);
    }
  }

  @override
  Future<bool> create(ProductModel product) async {
    try {
      var keys = sharedPreferences.getKeys();
      List<ProductModel> productList = [];
      for (var k in keys) {
        var val = sharedPreferences.getString(k);
        if (k.contains(prefixProductKey) && val is String) {
          productList.add(
            ProductModel.fromJson(
              jsonDecode(val),
            ),
          );
        }
      }
      var json = product.toJson;
      json["id"] = productList.length + 1;
      return await sharedPreferences.setString(
        '$prefixProductKey${product.id}',
        jsonEncode(product),
      );
    } catch (err) {
      throw const FailureResponse('LOCAL_ERROR', 500);
    }
  }

  @override
  Future<bool> delete(ProductModel product) async {
    try {
      return await sharedPreferences.remove('product_${product.id}');
    } catch (err) {
      throw const FailureResponse('LOCAL_ERROR', 500);
    }
  }

  @override
  Future<List<ProductModel>> list() async {
    try {
      var keys = sharedPreferences.getKeys();
      List<ProductModel> productList = [];
      for (var k in keys) {
        var val = sharedPreferences.getString(k);
        if (k.contains(prefixProductKey) && val is String) {
          productList.add(
            ProductModel.fromJson(
              jsonDecode(val),
            ),
          );
        }
      }
      return productList;
    } catch (err) {
      throw const FailureResponse('LOCAL_ERROR', 500);
    }
  }

  @override
  Future<bool> delleteAllProducts() async {
    try {
      var keys = sharedPreferences.getKeys();
      for (var k in keys) {
        if (k.contains(prefixProductKey)) {
          sharedPreferences.remove(k);
        }
      }
      return true;
    } catch (err) {
      throw const FailureResponse('LOCAL_ERROR', 500);
    }
  }

  @override
  Future<bool> cleanData() async {
    return await sharedPreferences.clear();
  }
}
