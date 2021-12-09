import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tooltip_state.dart';

class TooltipCubit extends Cubit<TooltipState> {
  TooltipCubit() : super(TooltipInitial());

  createTooltip() async {}
}
