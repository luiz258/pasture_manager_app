class FarmModel {
  String userId;
  String id;
  String farmName;
  String document;
  double area;
  String farmAddress;
  String city;
  String uf;

  FarmModel(
      {this.userId,
      this.id,
      this.farmName,
      this.document,
      this.area,
      this.farmAddress,
      this.city,
      this.uf});

  FarmModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    farmName = json['farmName'];
    document = json['document'];
    area = double.parse(json['area']);
    farmAddress = json['farmAddress'];
    city = json['city'];
    uf = json['uf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['farmName'] = this.farmName;
    data['document'] = this.document;
    data['area'] = this.area;
    data['farmAddress'] = this.farmAddress;
    data['city'] = this.city;
    data['uf'] = this.uf;
    return data;
  }
}
