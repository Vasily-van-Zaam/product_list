import 'package:dartz/dartz.dart';
import 'package:product_list/core/error.dart';
import 'package:product_list/core/use_case.dart';
import 'package:product_list/feature/domain/repositories/tooltip_repository.dart';

class Delete extends UseCase<bool, String> {
  final TooltipRepository tooltipRepository;

  Delete(this.tooltipRepository);
  @override
  Future<Either<Failure, bool>> call(params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
