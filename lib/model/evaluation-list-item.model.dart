class EvaluationListItemModel {
  String idPasture;
  String pastureName;
  String evaluationDate;

  EvaluationListItemModel(
      {this.idPasture, this.pastureName, this.evaluationDate});

  EvaluationListItemModel.fromJson(Map<String, dynamic> json) {
    idPasture = json['idPasture'];
    pastureName = json['pastureName'];
    evaluationDate = json['evaluationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idPasture'] = this.idPasture;
    data['pastureName'] = this.pastureName;
    data['evaluationDate'] = this.evaluationDate;
    return data;
  }
}
