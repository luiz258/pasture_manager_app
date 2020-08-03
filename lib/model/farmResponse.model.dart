class FarmResponse {
  String userId;
  String id;
  String farmName;
  Document document;
  dynamic area;
  String farmAddress;
  String city;
  String uf;

  FarmResponse(
      {this.userId,
      this.id,
      this.farmName,
      this.document,
      this.area,
      this.farmAddress,
      this.city,
      this.uf});

  FarmResponse.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    farmName = json['farmName'];
    document = json['document'] != null
        ? new Document.fromJson(json['document'])
        : null;
    area = json['area'];
    farmAddress = json['farmAddress'];
    city = json['city'];
    uf = json['uf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['farmName'] = this.farmName;
    if (this.document != null) {
      data['document'] = this.document.toJson();
    }
    data['area'] = this.area;
    data['farmAddress'] = this.farmAddress;
    data['city'] = this.city;
    data['uf'] = this.uf;
    return data;
  }
}

class Document {
  String numero;

  Document({this.numero});

  Document.fromJson(Map<String, dynamic> json) {
    numero = json['numero'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numero'] = this.numero;
    return data;
  }
}
