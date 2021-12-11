import 'package:equatable/equatable.dart';
import 'package:product_list/feature/domain/repositories/repositories.dart';

import 'create.dart';
import 'delete.dart';
import 'get_list.dart';

class TooltipCases {
  final TooltipRepository tooltipRepository;
  late Create create;
  late Delete delete;
  late GetList getList;

  TooltipCases(this.tooltipRepository) {
    create = Create(tooltipRepository);
    delete = Delete(tooltipRepository);
    getList = GetList(tooltipRepository);
  }
}

class GetListParams extends Equatable {
  final String search;
  final int limit;

  const GetListParams([this.search = '', this.limit = 10]);
  @override
  List<Object?> get props => [search, limit];
}
