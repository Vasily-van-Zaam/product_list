import 'package:product_list/feature/domain/entities/tooltip_entity.dart';

class TooltipModel extends TooltipEntity {
  const TooltipModel({
    int? id,
    String name = '',
  }) : super(
          id: id,
          name: name,
        );
  factory TooltipModel.fromJson(Map<String, dynamic> json) => TooltipModel(
        id: json["id"],
        name: json["name"],
      );
  Map<String, dynamic> get toJson => {
        "id": id,
        "name": name,
      };
}
