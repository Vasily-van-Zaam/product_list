import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:product_list/core/error.dart';
import 'package:product_list/core/use_case.dart';
import 'package:product_list/feature/domain/entities/tooltip_entity.dart';
import 'package:product_list/feature/domain/repositories/tooltip_repository.dart';

class GetList extends UseCase<List<TooltipEntity>, GetListParams> {
  final TooltipRepository tooltipRepository;

  GetList(this.tooltipRepository);
  @override
  Future<Either<Failure, List<TooltipEntity>>> call(params) async {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class GetListParams extends Equatable {
  final String search;
  final int limit;

  const GetListParams([this.search = '', this.limit = 10]);
  @override
  List<Object?> get props => [search, limit];
}
