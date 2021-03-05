//实体生成网站：https://javiercbk.github.io/json_to_dart/

import 'package:flutter_shop/pages/demo/provider_demo.dart';

class Category {
  String id;
  String name;
  int showName;
  int seq;
  int configKey;
  String url;
  String jsonUrl;
  String moreText;
  int isShowButton;
  String buttonDesc;
  String buttonFontColor;
  String buttonBackColor;
  Map rows;
  Map cols;
  Number maxProductNum;
  String moduleCode;
  DateTime beginAt;
  DateTime endAt;
  DateTime startAt;
  List<ProductDetailss> productDetailss;
  String link;
  bool isLogin;
  String moreLink;
  bool moreIsLogin;

  Category(
      {this.id,
      this.name,
      this.showName,
      this.seq,
      this.configKey,
      this.url,
      this.jsonUrl,
      this.moreText,
      this.isShowButton,
      this.buttonDesc,
      this.buttonFontColor,
      this.buttonBackColor,
      this.rows,
      this.cols,
      this.maxProductNum,
      this.moduleCode,
      this.beginAt,
      this.endAt,
      this.startAt,
      this.productDetailss,
      this.link,
      this.isLogin,
      this.moreLink,
      this.moreIsLogin});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    showName = json['showName'];
    seq = json['seq'];
    configKey = json['configKey'];
    url = json['url'];
    jsonUrl = json['jsonUrl'];
    moreText = json['moreText'];
    isShowButton = json['isShowButton'];
    buttonDesc = json['buttonDesc'];
    buttonFontColor = json['buttonFontColor'];
    buttonBackColor = json['buttonBackColor'];
    rows = json['rows'];
    cols = json['cols'];
    maxProductNum = json['maxProductNum'];
    moduleCode = json['moduleCode'];
    beginAt = json['beginAt'];
    endAt = json['endAt'];
    startAt = json['startAt'];
    if (json['productDetailss'] != null) {
      productDetailss = new List<ProductDetailss>();
      json['productDetailss'].forEach((v) {
        productDetailss.add(new ProductDetailss.fromJson(v));
      });
    }
    link = json['link'];
    isLogin = json['isLogin'];
    moreLink = json['moreLink'];
    moreIsLogin = json['moreIsLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['showName'] = this.showName;
    data['seq'] = this.seq;
    data['configKey'] = this.configKey;
    data['url'] = this.url;
    data['jsonUrl'] = this.jsonUrl;
    data['moreText'] = this.moreText;
    data['isShowButton'] = this.isShowButton;
    data['buttonDesc'] = this.buttonDesc;
    data['buttonFontColor'] = this.buttonFontColor;
    data['buttonBackColor'] = this.buttonBackColor;
    data['rows'] = this.rows;
    data['cols'] = this.cols;
    data['maxProductNum'] = this.maxProductNum;
    data['moduleCode'] = this.moduleCode;
    data['beginAt'] = this.beginAt;
    data['endAt'] = this.endAt;
    data['startAt'] = this.startAt;
    if (this.productDetailss != null) {
      data['productDetailss'] =
          this.productDetailss.map((v) => v.toJson()).toList();
    }
    data['link'] = this.link;
    data['isLogin'] = this.isLogin;
    data['moreLink'] = this.moreLink;
    data['moreIsLogin'] = this.moreIsLogin;
    return data;
  }
}

class ProductDetailss {
  String id;
  int skuId;
  String title;
  String secondTitle;
  String thirdTitle;
  String url;
  String jsonUrl;
  String video;
  int seq;
  int configKeyLattice;
  int latticeIndex;
  int configProductType;
  int isShowIcon;
  String topIcon;
  int cardType;
  String backColor;
  String liveInfoJson;
  String businessInfoJson;
  int price;
  int originalPrice;
  int categoryId;
  String link;
  int isLogin;
  String marketPrice;
  String nameLabel;
  String imageLabel;
  List<Map> extendList;
  Map heytapInfo;
  List<ActivityList> activityList;
  Number nameLabelWidth;
  Number nameLabelHeight;
  Number pricePrefix;
  Number priceSuffix;
  Number cardInfoType;
  String liveUrl;
  String storage;
  String seckill;
  String businessLink;
  List<ProductDetailLabelss> productDetailLabelss;

  ProductDetailss(
      {this.id,
      this.skuId,
      this.title,
      this.secondTitle,
      this.thirdTitle,
      this.url,
      this.jsonUrl,
      this.video,
      this.seq,
      this.configKeyLattice,
      this.latticeIndex,
      this.configProductType,
      this.isShowIcon,
      this.topIcon,
      this.cardType,
      this.backColor,
      this.liveInfoJson,
      this.businessInfoJson,
      this.price,
      this.originalPrice,
      this.categoryId,
      this.link,
      this.isLogin,
      this.marketPrice,
      this.nameLabel,
      this.imageLabel,
      this.extendList,
      this.heytapInfo,
      this.activityList,
      this.nameLabelWidth,
      this.nameLabelHeight,
      this.pricePrefix,
      this.priceSuffix,
      this.cardInfoType,
      this.liveUrl,
      this.storage,
      this.seckill,
      this.businessLink,
      this.productDetailLabelss});

  ProductDetailss.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    skuId = json['skuId'];
    title = json['title'];
    secondTitle = json['secondTitle'];
    thirdTitle = json['thirdTitle'];
    url = json['url'];
    jsonUrl = json['jsonUrl'];
    video = json['video'];
    seq = json['seq'];
    configKeyLattice = json['configKeyLattice'];
    latticeIndex = json['latticeIndex'];
    configProductType = json['configProductType'];
    isShowIcon = json['isShowIcon'];
    topIcon = json['topIcon'];
    cardType = json['cardType'];
    backColor = json['backColor'];
    liveInfoJson = json['liveInfoJson'];
    businessInfoJson = json['businessInfoJson'];
    price = json['price'];
    originalPrice = json['originalPrice'];
    categoryId = json['categoryId'];
    link = json['link'];
    isLogin = json['isLogin'];
    marketPrice = json['marketPrice'];
    nameLabel = json['nameLabel'];
    imageLabel = json['imageLabel'];
    extendList = json['extendList'];
    heytapInfo = json['heytapInfo'];
    if (json['activityList'] != null) {
      activityList = new List<ActivityList>();
      json['activityList'].forEach((v) {
        activityList.add(new ActivityList.fromJson(v));
      });
    }
    nameLabelWidth = json['nameLabelWidth'];
    nameLabelHeight = json['nameLabelHeight'];
    pricePrefix = json['pricePrefix'];
    priceSuffix = json['priceSuffix'];
    cardInfoType = json['cardInfoType'];
    liveUrl = json['liveUrl'];
    storage = json['storage'];
    seckill = json['seckill'];
    businessLink = json['businessLink'];
    if (json['productDetailLabelss'] != null) {
      productDetailLabelss = new List<ProductDetailLabelss>();
      json['productDetailLabelss'].forEach((v) {
        productDetailLabelss.add(new ProductDetailLabelss.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['skuId'] = this.skuId;
    data['title'] = this.title;
    data['secondTitle'] = this.secondTitle;
    data['thirdTitle'] = this.thirdTitle;
    data['url'] = this.url;
    data['jsonUrl'] = this.jsonUrl;
    data['video'] = this.video;
    data['seq'] = this.seq;
    data['configKeyLattice'] = this.configKeyLattice;
    data['latticeIndex'] = this.latticeIndex;
    data['configProductType'] = this.configProductType;
    data['isShowIcon'] = this.isShowIcon;
    data['topIcon'] = this.topIcon;
    data['cardType'] = this.cardType;
    data['backColor'] = this.backColor;
    data['liveInfoJson'] = this.liveInfoJson;
    data['businessInfoJson'] = this.businessInfoJson;
    data['price'] = this.price;
    data['originalPrice'] = this.originalPrice;
    data['categoryId'] = this.categoryId;
    data['link'] = this.link;
    data['isLogin'] = this.isLogin;
    data['marketPrice'] = this.marketPrice;
    data['nameLabel'] = this.nameLabel;
    data['imageLabel'] = this.imageLabel;
    data['extendList'] = this.extendList;
    data['heytapInfo'] = this.heytapInfo;
    if (this.activityList != null) {
      data['activityList'] = this.activityList.map((v) => v.toJson()).toList();
    }
    data['nameLabelWidth'] = this.nameLabelWidth;
    data['nameLabelHeight'] = this.nameLabelHeight;
    data['pricePrefix'] = this.pricePrefix;
    data['priceSuffix'] = this.priceSuffix;
    data['cardInfoType'] = this.cardInfoType;
    data['liveUrl'] = this.liveUrl;
    data['storage'] = this.storage;
    data['seckill'] = this.seckill;
    data['businessLink'] = this.businessLink;
    if (this.productDetailLabelss != null) {
      data['productDetailLabelss'] =
          this.productDetailLabelss.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActivityList {
  int type;
  String activityInfo;

  ActivityList({this.type, this.activityInfo});

  ActivityList.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    activityInfo = json['activityInfo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['activityInfo'] = this.activityInfo;
    return data;
  }
}

class ProductDetailLabelss {
  String id;
  String name;
  String configKey;
  String pigment;
  Null beginAt;
  Null endAt;

  ProductDetailLabelss(
      {this.id,
      this.name,
      this.configKey,
      this.pigment,
      this.beginAt,
      this.endAt});

  ProductDetailLabelss.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    configKey = json['configKey'];
    pigment = json['pigment'];
    beginAt = json['beginAt'];
    endAt = json['endAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['configKey'] = this.configKey;
    data['pigment'] = this.pigment;
    data['beginAt'] = this.beginAt;
    data['endAt'] = this.endAt;
    return data;
  }
}
