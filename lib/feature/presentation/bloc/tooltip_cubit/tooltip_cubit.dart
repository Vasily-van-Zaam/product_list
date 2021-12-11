import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_list/feature/domain/entities/tooltip_entity.dart';
import 'package:product_list/feature/domain/use_cases/tooltip_case/tooltip_cases.dart';

part 'tooltip_state.dart';

class TooltipCubit extends Cubit<TooltipState> {
  final TooltipCases tooltipCases;
  TooltipCubit(this.tooltipCases) : super(TooltipInitial());

  create(TooltipEntity entity) async {
    var res = await tooltipCases.create(entity);
    emit(
      res.fold(
        (l) => TooltipError(l.message, l.status),
        (r) => TooltipCreated(entity),
      ),
    );
  }

  getList(GetListParams parapms) async {
    var res = await tooltipCases.getList(parapms);

    emit(
      res.fold(
        (l) => TooltipError(l.message, l.status),
        (r) => ToolyipListLoaded(r),
      ),
    );
  }

  delete(TooltipEntity entity) async {
    var res = await tooltipCases.delete(entity);
    emit(
      res.fold(
        (l) => TooltipError(l.message, l.status),
        (r) => TolltipDeleted(),
      ),
    );
  }
}
