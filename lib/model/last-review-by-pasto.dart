class LastReviewByPasto {
  String pastureName;
  DateTime evaluationDate;
  String grassType;
  String tagPastureIndicator;
  String tagPast;
  String officialClassification;

  LastReviewByPasto(
      {this.pastureName,
      this.evaluationDate,
      this.grassType,
      this.tagPastureIndicator,
      this.tagPast,
      this.officialClassification});

  LastReviewByPasto.fromJson(Map<String, dynamic> json) {
    pastureName = json['pastureName'];
    evaluationDate = DateTime.parse(json['evaluationDate']);
    grassType = json['grassType'];
    tagPastureIndicator = json['tagPastureIndicator'];
    tagPast = json['tagPast'];
    officialClassification = json['officialClassification'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pastureName'] = this.pastureName;
    data['evaluationDate'] = this.evaluationDate;
    data['grassType'] = this.grassType;
    data['tagPastureIndicator'] = this.tagPastureIndicator;
    data['tagPast'] = this.tagPast;
    data['officialClassification'] = this.officialClassification;
    return data;
  }
}
