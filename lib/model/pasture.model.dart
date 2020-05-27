class PastureModel {
  String id;
  String farmId;
  String pastureName;
  double area;
  String grassType;
  String port;
  String vigor;
  String descriptionText;

  PastureModel(
      {this.id,
      this.farmId,
      this.pastureName,
      this.area,
      this.grassType,
      this.port,
      this.vigor,
      this.descriptionText});

  PastureModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    farmId = json['farmId'];
    pastureName = json['pastureName'];
    area = json['area'];
    grassType = json['grassType'];
    port = json['port'];
    vigor = json['vigor'];
    descriptionText = json['descriptionText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['farmId'] = this.farmId;
    data['pastureName'] = this.pastureName;
    data['area'] = this.area;
    data['grassType'] = this.grassType;
    data['port'] = this.port;
    data['vigor'] = this.vigor;
    data['descriptionText'] = this.descriptionText;
    return data;
  }
}
