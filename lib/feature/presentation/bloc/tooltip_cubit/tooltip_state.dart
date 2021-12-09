part of 'tooltip_cubit.dart';

abstract class TooltipState extends Equatable {
  const TooltipState();

  @override
  List<Object> get props => [];
}

class TooltipInitial extends TooltipState {}

class TooltipCreated extends TooltipState {}
