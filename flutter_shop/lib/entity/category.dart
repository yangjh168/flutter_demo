//实体生成网站：https://javiercbk.github.io/json_to_dart/

class Category {
  String id;
  String name;
  String icon;
  String bannerImg;
  String iconImg;
  List<ChildCategory> children;

  Category(
      {this.id,
      this.name,
      this.icon,
      this.bannerImg,
      this.iconImg,
      this.children});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    bannerImg = json['bannerImg'];
    iconImg = json['iconImg'];
    if (json['children'] != null) {
      children = new List<ChildCategory>();
      json['children'].forEach((v) {
        children.add(new ChildCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['bannerImg'] = this.bannerImg;
    data['iconImg'] = this.iconImg;
    if (this.children != null) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildCategory {
  String id;
  String name;
  String icon;
  String bannerImg;

  ChildCategory({this.id, this.name, this.icon, this.bannerImg});

  ChildCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    bannerImg = json['bannerImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['bannerImg'] = this.bannerImg;
    return data;
  }
}
