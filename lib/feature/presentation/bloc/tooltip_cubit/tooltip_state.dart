part of 'tooltip_cubit.dart';

abstract class TooltipState extends Equatable {
  const TooltipState();

  @override
  List<Object> get props => [];
}

class TooltipInitial extends TooltipState {}

class TooltipCreated extends TooltipState {
  final TooltipEntity tooltip;

  const TooltipCreated(this.tooltip);
  @override
  List<Object> get props => [tooltip];
}

class TooltipError extends TooltipState {
  final String message;
  final int status;

  const TooltipError(this.message, this.status);
  @override
  List<Object> get props => [message, status];
}

class ToolyipListLoaded extends TooltipState {
  final List<TooltipEntity> list;

  const ToolyipListLoaded(this.list);
  @override
  List<Object> get props => [list];
}

class TolltipDeleted extends TooltipState {}
