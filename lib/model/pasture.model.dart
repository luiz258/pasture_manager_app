class PastureModel {
  String pastureName;
  String area;
  String typeGrass;
  String dateStartPasture;
  String description;

  PastureModel(
      {this.pastureName,
      this.area,
      this.typeGrass,
      this.dateStartPasture,
      this.description});

  PastureModel.fromJson(Map<String, dynamic> json) {
    pastureName = json['pastureName'];
    area = json['area'];
    typeGrass = json['typeGrass'];
    dateStartPasture = json['dateStartPasture'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pastureName'] = this.pastureName;
    data['area'] = this.area;
    data['typeGrass'] = this.typeGrass;
    data['dateStartPasture'] = this.dateStartPasture;
    data['description'] = this.description;
    return data;
  }
}
