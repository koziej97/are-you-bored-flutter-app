import 'dart:convert';

import 'package:are_you_bored/data/data_provider/activity_provider.dart';
import 'package:are_you_bored/data/model/activity_model.dart';

class ActivityRepository {
  Future<ActivityModel> getRandomActivity() async {
    final response = await ActivityProvider.getRandomActivity();
    return activityModelFromJson(response);
  }

  ActivityModel activityModelFromJson(String string){
    var activity = ActivityModel.fromJson(json.decode(string));
    activity.setupBackgroundType(activity);
    return activity;
  }
}