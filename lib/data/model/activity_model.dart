class ActivityModel {
  ActivityModel({
    required this.activity,
    required this.type,
    required this.participants,
    required this.link
  });

  String activity;
  String type;
  int participants;
  String link;

  factory ActivityModel.fromJson(Map<String, dynamic> json){
    return ActivityModel(
        activity: json["activity"],
        type: json["type"],
        participants: json["participants"],
        link: json["link"] ?? ""
    );
  }
}