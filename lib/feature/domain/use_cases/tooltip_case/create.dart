import 'package:dartz/dartz.dart';
import 'package:product_list/core/error.dart';
import 'package:product_list/core/use_case.dart';
import 'package:product_list/feature/domain/entities/tooltip_entity.dart';
import 'package:product_list/feature/domain/repositories/tooltip_repository.dart';

class Create extends UseCase<TooltipEntity, String> {
  final TooltipRepository tooltipRepository;

  Create(this.tooltipRepository);
  @override
  Future<Either<Failure, TooltipEntity>> call(params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
