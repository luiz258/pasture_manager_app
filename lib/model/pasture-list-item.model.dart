class PastureListItemModel {
  String sIdPasture;
  String pastureName;
  String tagPasture;
  String tagPastureActionActua;
  String grassName;

  PastureListItemModel(
      {this.sIdPasture,
      this.pastureName,
      this.tagPasture,
      this.tagPastureActionActua,
      this.grassName});

  PastureListItemModel.fromJson(Map<String, dynamic> json) {
    sIdPasture = json['_idPasture'];
    pastureName = json['pastureName'];
    tagPasture = json['tagPasture'];
    tagPastureActionActua = json['tagPastureActionActua'];
    grassName = json['grassName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_idPasture'] = this.sIdPasture;
    data['pastureName'] = this.pastureName;
    data['tagPasture'] = this.tagPasture;
    data['tagPastureActionActua'] = this.tagPastureActionActua;
    data['grassName'] = this.grassName;
    return data;
  }
}