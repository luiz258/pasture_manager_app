class PastureListItemModel {
  String idPasture;
  String pastureName;
  String tagPasture;
  String tagPastureActionActua;
  String grassName;

  PastureListItemModel(
      {this.idPasture,
      this.pastureName,
      this.tagPasture,
      this.tagPastureActionActua,
      this.grassName});

  PastureListItemModel.fromJson(Map<String, dynamic> json) {
    idPasture = json['idPasture'];
    pastureName = json['pastureName'];
    tagPasture = json['tagPasture'];
    tagPastureActionActua = json['tagPastureActionActua'];
    grassName = json['grassName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idPasture'] = this.idPasture;
    data['pastureName'] = this.pastureName;
    data['tagPasture'] = this.tagPasture;
    data['tagPastureActionActua'] = this.tagPastureActionActua;
    data['grassName'] = this.grassName;
    return data;
  }
}