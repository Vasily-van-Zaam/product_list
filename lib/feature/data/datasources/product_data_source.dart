import 'dart:convert';

import 'package:product_list/core/failure.dart';
import 'package:product_list/feature/data/models/models.dart';

import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalStorageDataSource {
  Future<List<ProductModel>> getList();
  Future<ProductModel> create(ProductModel product);
  Future<ProductModel> delete(ProductModel product);
  Future<ProductModel> change(ProductModel product);
  Future<bool> delleteAllProducts();
  Future<bool> cleanData();
}

const prefixProductKey = 'product_';

class ProductLocalStorageDataSourceImpl
    implements ProductLocalStorageDataSource {
  final SharedPreferences sharedPreferences;

  ProductLocalStorageDataSourceImpl(this.sharedPreferences);
  @override
  Future<ProductModel> change(ProductModel product) async {
    try {
      await sharedPreferences.setString(
        '$prefixProductKey${product.id}',
        jsonEncode(product.toJson),
      );
      return product;
    } catch (err) {
      throw const FailureResponse('LOCAL_ERROR', 500);
    }
  }

  @override
  Future<ProductModel> create(ProductModel product) async {
    try {
      var keys = sharedPreferences.getKeys();
      List<ProductModel> productList = [];

      for (var k in keys) {
        if (k.contains(prefixProductKey)) {
          var val = sharedPreferences.getString(k);
          if (val is String) {
            productList.add(
              ProductModel.fromJson(
                jsonDecode(val),
              ),
            );
          }
        }
      }
      var json = product.toJson;
      json["id"] = productList.length;

      await sharedPreferences.setString(
        '$prefixProductKey${json["id"]}',
        jsonEncode(json),
      );
      return ProductModel.fromJson(json);
    } catch (err) {
      throw FailureResponse('LOCAL_ERROR $err', 500);
    }
  }

  @override
  Future<ProductModel> delete(ProductModel product) async {
    try {
      await sharedPreferences.remove('product_${product.id}');
      return product;
    } catch (err) {
      throw FailureResponse('LOCAL_ERROR $err', 500);
    }
  }

  @override
  Future<List<ProductModel>> getList() async {
    try {
      var keys = sharedPreferences.getKeys();
      List<ProductModel> productList = [];

      for (var k in keys) {
        if (k.contains(prefixProductKey)) {
          var val = sharedPreferences.getString(k);
          if (val is String) {
            productList.add(
              ProductModel.fromJson(
                jsonDecode(val),
              ),
            );
          }
        }
      }

      return productList;
    } catch (err) {
      throw FailureResponse('LOCAL_ERROR $err', 500);
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
      throw FailureResponse('LOCAL_ERROR $err', 500);
    }
  }

  @override
  Future<bool> cleanData() async {
    return await sharedPreferences.clear();
  }
}
