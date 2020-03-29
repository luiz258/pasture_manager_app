class EvaluationModel {
  String idPasture;
  String pastureCondition;
  String rfl;
  String leafNumber;

  EvaluationModel(
      {this.idPasture, this.pastureCondition, this.rfl, this.leafNumber});

  EvaluationModel.fromJson(Map<String, dynamic> json) {
    idPasture = json['idPasture'];
    pastureCondition = json['pastureCondition'];
    rfl = json['rfl'];
    leafNumber = json['leafNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idPasture'] = this.idPasture;
    data['pastureCondition'] = this.pastureCondition;
    data['rfl'] = this.rfl;
    data['leafNumber'] = this.leafNumber;
    return data;
  }
}
