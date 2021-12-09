import 'package:product_list/feature/domain/repositories/repositories.dart';

import 'create.dart';
import 'change.dart';
import 'delete.dart';
import 'delete_all.dart';
import 'get_list.dart';

class ProductCases {
  final ProductRepository productRepository;
  late GetList getList;
  late Create create;
  late Change change;
  late Delete delete;
  late DeleteAll deleteAll;

  ProductCases(this.productRepository) {
    getList = GetList(productRepository);
    create = Create(productRepository);
    change = Change(productRepository);
    delete = Delete(productRepository);
    deleteAll = DeleteAll(productRepository);
  }
}
