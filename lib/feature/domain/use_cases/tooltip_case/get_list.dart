import 'package:dartz/dartz.dart';

import 'package:product_list/core/failure.dart';
import 'package:product_list/core/use_case.dart';
import 'package:product_list/feature/domain/entities/tooltip_entity.dart';
import 'package:product_list/feature/domain/repositories/tooltip_repository.dart';

import '../use_cases.dart';

class GetList extends UseCase<List<TooltipEntity>, GetListParams> {
  final TooltipRepository tooltipRepository;

  GetList(this.tooltipRepository);
  @override
  Future<Either<Failure, List<TooltipEntity>>> call(params) async {
    return tooltipRepository.getList(
      search: params.search,
      limit: params.limit,
    );
  }
}
