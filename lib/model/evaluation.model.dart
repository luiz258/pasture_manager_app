class EvaluationModel {
  String id;
  String idPasture;
  String tagPast;
  String tagPastureIndicator;
  String classification;
  String officialClassification;
  String rated;
  double note;
  DateTime evaluationDate;
  bool syncData;

  EvaluationModel(
      {this.id,
      this.idPasture,
      this.tagPast,
      this.tagPastureIndicator,
      this.classification,
      this.officialClassification,
      this.rated,
      this.note,
      this.evaluationDate,
      this.syncData});

  EvaluationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idPasture = json['idPasture'];
    tagPast = json['tagPast'];
    tagPastureIndicator = json['tagPastureIndicator'];
    classification = json['classification'];
    officialClassification = json['officialClassification'];
    rated = json['rated'];
    note = json['note'];
    evaluationDate = json['evaluationDate'];
    syncData = json['syncData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idPasture'] = this.idPasture;
    data['tagPast'] = this.tagPast;
    data['tagPastureIndicator'] = this.tagPastureIndicator;
    data['classification'] = this.classification;
    data['officialClassification'] = this.officialClassification;
    data['rated'] = this.rated;
    data['note'] = this.note;
    data['evaluationDate'] = this.evaluationDate;
    data['syncData'] = this.syncData;
    return data;
  }
}
