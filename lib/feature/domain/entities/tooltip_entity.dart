import 'package:equatable/equatable.dart';

class TooltipEntity extends Equatable {
  final int? id;
  final String name;

  const TooltipEntity({
    required this.name,
    this.id,
  });

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
