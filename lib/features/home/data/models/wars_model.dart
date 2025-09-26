import 'package:dalel_app/core/models/data_model.dart';
import 'package:dalel_app/core/utils/app_strings.dart';

class WarsModel extends DataModel {
  WarsModel({
    required super.name,
    required super.image,
    required super.discription,
    required super.category,
  });

  factory WarsModel.fromjson(jsonData) {
    return WarsModel(
      name: jsonData[FireBaseStrings.name],
      image: jsonData[FireBaseStrings.image],
      discription: jsonData[FireBaseStrings.description],
      category: jsonData[FireBaseStrings.category],
    );
  }
}
