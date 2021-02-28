//实体生成网站：https://javiercbk.github.io/json_to_dart/

class Category {
  int id;
  String iosShowFlag;
  String name;
  List<SubCategorys> subCategorys;

  Category({this.id, this.iosShowFlag, this.name, this.subCategorys});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iosShowFlag = json['iosShowFlag'];
    name = json['name'];
    if (json['subCategorys'] != null) {
      subCategorys = new List<SubCategorys>();
      json['subCategorys'].forEach((v) {
        subCategorys.add(new SubCategorys.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['iosShowFlag'] = this.iosShowFlag;
    data['name'] = this.name;
    if (this.subCategorys != null) {
      data['subCategorys'] = this.subCategorys.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategorys {
  int id;
  String iosShowFlag;
  String name;
  List<ItemCategorys> subCategorys;
  int type;

  SubCategorys(
      {this.id, this.iosShowFlag, this.name, this.subCategorys, this.type});

  SubCategorys.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iosShowFlag = json['iosShowFlag'];
    name = json['name'];
    if (json['subCategorys'] != null) {
      subCategorys = new List<ItemCategorys>();
      json['subCategorys'].forEach((v) {
        subCategorys.add(new ItemCategorys.fromJson(v));
      });
    }
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['iosShowFlag'] = this.iosShowFlag;
    data['name'] = this.name;
    if (this.subCategorys != null) {
      data['subCategorys'] = this.subCategorys.map((v) => v.toJson()).toList();
    }
    data['type'] = this.type;
    return data;
  }
}

class ItemCategorys {
  String categoryUrl;
  int id;
  String iosShowFlag;
  String name;
  String photoName;
  String photoPath;
  int type;
  String value;
  String webVideoPath;

  ItemCategorys(
      {this.categoryUrl,
      this.id,
      this.iosShowFlag,
      this.name,
      this.photoName,
      this.photoPath,
      this.type,
      this.value,
      this.webVideoPath});

  ItemCategorys.fromJson(Map<String, dynamic> json) {
    categoryUrl = json['categoryUrl'];
    id = json['id'];
    iosShowFlag = json['iosShowFlag'];
    name = json['name'];
    photoName = json['photoName'];
    photoPath = json['photoPath'];
    type = json['type'];
    value = json['value'];
    webVideoPath = json['webVideoPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryUrl'] = this.categoryUrl;
    data['id'] = this.id;
    data['iosShowFlag'] = this.iosShowFlag;
    data['name'] = this.name;
    data['photoName'] = this.photoName;
    data['photoPath'] = this.photoPath;
    data['type'] = this.type;
    data['value'] = this.value;
    data['webVideoPath'] = this.webVideoPath;
    return data;
  }
}
