class PastureListItemModel {
  String idPasture;
  String pastureName;
  String tagPasture;
  String tagIndicator;
  String grassType;

  PastureListItemModel(
      {this.idPasture,
      this.pastureName,
      this.tagPasture,
      this.tagIndicator,
      this.grassType});

  PastureListItemModel.fromJson(Map<String, dynamic> json) {
    idPasture = json['idPasture'];
    pastureName = json['pastureName'];
    tagPasture = json['tagPasture'];
    tagIndicator = json['tagPastureActionActua'];
    grassType = json['grassName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idPasture'] = this.idPasture;
    data['pastureName'] = this.pastureName;
    data['tagPasture'] = this.tagPasture;
    data['tagPastureActionActua'] = this.tagIndicator;
    data['grassName'] = this.grassType;
    return data;
  }
}