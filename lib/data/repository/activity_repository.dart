import 'dart:convert';

import 'package:are_you_bored/data/data_provider/activity_provider.dart';
import 'package:are_you_bored/data/model/activity_model.dart';

class ActivityRepository {
  Future<ActivityModel?> getRandomActivity() async {
    final response = await ActivityProvider.getRandomActivity();
    if (response == "error"){
      return null;
    }
    return activityModelFromJson(response);
  }

  ActivityModel activityModelFromJson(String string){
    return ActivityModel.fromJson(json.decode(string));
  }
}