const bannerList = [
  'http://m.360buyimg.com/mobilecms/s700x280_jfs/t1/159705/1/8162/113888/6033a795E5f0d4692/12d31b57e48e4706.jpg!q70.jpg.dpg',
  'http://m.360buyimg.com/mobilecms/s700x280_jfs/t1/150713/13/20129/175829/602f862eE6bde295f/bd469d05c3a4075e.jpg!cr_1125x445_0_171!q70.jpg.dpg',
  'http://m.360buyimg.com/mobilecms/s700x280_jfs/t1/123624/24/2195/99979/5ec3a165E12b276e2/2e5b8a2606fbabfe.jpg!q70.jpg.dpg',
  'http://m.360buyimg.com/mobilecms/s700x280_jfs/t1/156744/4/10960/130882/6034c96aEe021315b/fc70444d19aca670.jpg!q70.jpg.dpg',
];

// 首页导航菜单
const gridList = [
  {
    'name': '线上超市',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/125678/35/5947/4868/5efbf28cEbf04a25a/e2bcc411170524f0.png'
  },
  {
    'name': '数码电器',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/135931/4/3281/5598/5efbf2c0Edbdc82c7/ed9861b4ddfb9f30.png'
  },
  {
    'name': '潮流服饰',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/140012/8/1804/3641/5efbf318E38bd5dad/0db99d859ab16ce9.png'
  },
  {
    'name': '免费水果',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/129215/21/5978/3618/5efbf344Ebec23ae8/59712d986b10bb0a.png'
  },
  {
    'name': '快递到家',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/116602/7/11200/3796/5efbf375Ebba41029/f07cc166f368fa05.png'
  },
  {
    'name': '生活服务',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/146390/3/1846/4909/5efbf39aEe5f5f797/300071558a9ab078.png.webp'
  },
  {
    'name': '领积分',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/150351/19/14167/6853/5fed882dE195ef673/b2aa7d67e675baf8.png.webp'
  },
  {
    'name': '领券中心',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/113589/24/11332/4897/5efbf3feE705d87db/e5c12d5e943266b9.png.webp'
  },
  {
    'name': '钱包',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/131663/33/3380/3674/5efbf50fEf79cf314/af4b57d2383e605d.png.webp'
  },
  {
    'name': '会员专属',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/123730/37/5924/4189/5efbf567E0a226121/d04df7c74c87cf68.png.webp'
  },
];

// 首页推荐商品
const recommendList = [
  {
    'image':
        'http://img11.360buyimg.com/n7/s150x150_jfs/t1/159008/30/6738/137611/6020c2d0Efe4465c1/59e519826d9c74a9.jpg.dpg',
    'mallPrice': '18.5',
    'price': '26.8'
  },
  {
    'image':
        'http://img11.360buyimg.com/n7/s150x150_jfs/t1/154157/25/16429/150418/601d0138Ef57c8ded/384b6ca62f6cf9de.jpg',
    'mallPrice': '18.5',
    'price': '26.8'
  },
  {
    'image':
        'http://img11.360buyimg.com/n7/s150x150_jfs/t1/155285/4/18202/128283/602f2b22E8b6d34b7/58b21dfa476ef446.jpg.dpg',
    'mallPrice': '18.5',
    'price': '26.8'
  },
  {
    'image':
        'http://img11.360buyimg.com/n7/s150x150_jfs/t1/159008/30/6738/137611/6020c2d0Efe4465c1/59e519826d9c74a9.jpg.dpg',
    'mallPrice': '18.5',
    'price': '26.8'
  },
  {
    'image':
        'http://img11.360buyimg.com/n7/s150x150_jfs/t1/154157/25/16429/150418/601d0138Ef57c8ded/384b6ca62f6cf9de.jpg.dpg',
    'mallPrice': '18.5',
    'price': '26.8'
  },
  {
    'image':
        'http://img11.360buyimg.com/n7/s150x150_jfs/t1/155285/4/18202/128283/602f2b22E8b6d34b7/58b21dfa476ef446.jpg.dpg',
    'mallPrice': '18.5',
    'price': '26.8'
  },
];

//火爆商品
const hotList = [
  {
    "name": null,
    "showName": null,
    "seq": null,
    "configKey": 2,
    "url": null,
    "jsonUrl": null,
    "moreText": null,
    "isShowButton": null,
    "buttonDesc": null,
    "buttonFontColor": null,
    "buttonBackColor": null,
    "rows": null,
    "cols": null,
    "maxProductNum": null,
    "moduleCode": null,
    "beginAt": null,
    "endAt": null,
    "startAt": null,
    "productDetailss": [
      {
        "skuId": 3471,
        "title": "OPPO Find X3",
        "secondTitle": "",
        "thirdTitle": null,
        "url":
            "https://dsfs.oppo.com/archives/202103/20210303110356603f0188b2d1d.png?_w_=320&_h_=320",
        "jsonUrl": null,
        "video": null,
        "seq": null,
        "configKeyLattice": null,
        "latticeIndex": null,
        "configProductType": null,
        "isShowIcon": null,
        "topIcon": null,
        "cardType": null,
        "backColor": null,
        "liveInfoJson": null,
        "businessInfoJson": null,
        "price": 99999,
        "originalPrice": null,
        "categoryId": 1,
        "link":
            "https://store.oppo.com/cn/app/product/index?skuId=3471&us=search",
        "isLogin": 0,
        "marketPrice": "3月11日 全球发布",
        "nameLabel": null,
        "imageLabel": null,
        "extendList": null,
        "heytapInfo": null,
        "activityList": null,
        "nameLabelWidth": null,
        "nameLabelHeight": null,
        "pricePrefix": null,
        "priceSuffix": null,
        "cardInfoType": null,
        "liveUrl": null,
        "storage": null,
        "seckill": null,
        "businessLink": null,
        "productDetailLabelss": null
      },
      {
        "skuId": 3459,
        "title": "OPPO Find X3 Pro",
        "secondTitle": "",
        "thirdTitle": null,
        "url":
            "https://dsfs.oppo.com/archives/202103/20210303110326603f012e85db6.png?_w_=320&_h_=320",
        "jsonUrl": null,
        "video": null,
        "seq": null,
        "configKeyLattice": null,
        "latticeIndex": null,
        "configProductType": null,
        "isShowIcon": null,
        "topIcon": null,
        "cardType": null,
        "backColor": null,
        "liveInfoJson": null,
        "businessInfoJson": null,
        "price": 99999,
        "originalPrice": null,
        "categoryId": 1,
        "link":
            "https://store.oppo.com/cn/app/product/index?skuId=3459&us=search",
        "isLogin": 0,
        "marketPrice": "3月11日 全球发布",
        "nameLabel": null,
        "imageLabel": null,
        "extendList": null,
        "heytapInfo": null,
        "activityList": null,
        "nameLabelWidth": null,
        "nameLabelHeight": null,
        "pricePrefix": null,
        "priceSuffix": null,
        "cardInfoType": null,
        "liveUrl": null,
        "storage": null,
        "seckill": null,
        "businessLink": null,
        "productDetailLabelss": null
      },
      {
        "skuId": 3446,
        "title": "Reno5 K 月夜黑 8G+128G",
        "secondTitle": "",
        "thirdTitle": null,
        "url":
            "https://dsfs.oppo.com/archives/202102/202102230302036034a8e37deab.png?_w_=320&_h_=320",
        "jsonUrl": null,
        "video": null,
        "seq": null,
        "configKeyLattice": null,
        "latticeIndex": null,
        "configProductType": null,
        "isShowIcon": null,
        "topIcon": null,
        "cardType": null,
        "backColor": null,
        "liveInfoJson": null,
        "businessInfoJson": null,
        "price": 2699,
        "originalPrice": null,
        "categoryId": 1,
        "link":
            "https://store.oppo.com/cn/app/product/index?skuId=3446&us=search",
        "isLogin": 0,
        "marketPrice": "",
        "nameLabel": null,
        "imageLabel": null,
        "extendList": null,
        "heytapInfo": null,
        "activityList": null,
        "nameLabelWidth": null,
        "nameLabelHeight": null,
        "pricePrefix": null,
        "priceSuffix": null,
        "cardInfoType": null,
        "liveUrl": null,
        "storage": null,
        "seckill": null,
        "businessLink": null,
        "productDetailLabelss": null
      },
      {
        "skuId": 3445,
        "title": "Reno5 K 星河入梦 8G+128G",
        "secondTitle": "",
        "thirdTitle": null,
        "url":
            "https://dsfs.oppo.com/archives/202102/202102230302226034a87eeab0f.png?_w_=320&_h_=320",
        "jsonUrl": null,
        "video": null,
        "seq": null,
        "configKeyLattice": null,
        "latticeIndex": null,
        "configProductType": null,
        "isShowIcon": null,
        "topIcon": null,
        "cardType": null,
        "backColor": null,
        "liveInfoJson": null,
        "businessInfoJson": null,
        "price": 2699,
        "originalPrice": null,
        "categoryId": 1,
        "link":
            "https://store.oppo.com/cn/app/product/index?skuId=3445&us=search",
        "isLogin": 0,
        "marketPrice": "",
        "nameLabel": null,
        "imageLabel": null,
        "extendList": null,
        "heytapInfo": null,
        "activityList": null,
        "nameLabelWidth": null,
        "nameLabelHeight": null,
        "pricePrefix": null,
        "priceSuffix": null,
        "cardInfoType": null,
        "liveUrl": null,
        "storage": null,
        "seckill": null,
        "businessLink": null,
        "productDetailLabelss": null
      },
      {
        "skuId": 3444,
        "title": "Reno5 K 恋恋青风 8G+128G",
        "secondTitle": "",
        "thirdTitle": null,
        "url":
            "https://dsfs.oppo.com/archives/202102/202102230202496034a7a96c422.png?_w_=320&_h_=320",
        "jsonUrl": null,
        "video": null,
        "seq": null,
        "configKeyLattice": null,
        "latticeIndex": null,
        "configProductType": null,
        "isShowIcon": null,
        "topIcon": null,
        "cardType": null,
        "backColor": null,
        "liveInfoJson": null,
        "businessInfoJson": null,
        "price": 2699,
        "originalPrice": null,
        "categoryId": 1,
        "link":
            "https://store.oppo.com/cn/app/product/index?skuId=3444&us=search",
        "isLogin": 0,
        "marketPrice": "",
        "nameLabel": null,
        "imageLabel": null,
        "extendList": null,
        "heytapInfo": null,
        "activityList": null,
        "nameLabelWidth": null,
        "nameLabelHeight": null,
        "pricePrefix": null,
        "priceSuffix": null,
        "cardInfoType": null,
        "liveUrl": null,
        "storage": null,
        "seckill": null,
        "businessLink": null,
        "productDetailLabelss": null
      },
      {
        "skuId": 3424,
        "title": "realme 真我GT 5G 曙光/12GB+256GB",
        "secondTitle": "",
        "thirdTitle": null,
        "url":
            "https://dsfs.oppo.com/archives/202103/202103040303436040868b7e17c.png?_w_=320&_h_=320",
        "jsonUrl": null,
        "video": null,
        "seq": null,
        "configKeyLattice": null,
        "latticeIndex": null,
        "configProductType": null,
        "isShowIcon": null,
        "topIcon": null,
        "cardType": null,
        "backColor": null,
        "liveInfoJson": null,
        "businessInfoJson": null,
        "price": 3299,
        "originalPrice": 3399,
        "categoryId": 34,
        "link":
            "https://store.oppo.com/cn/app/product/index?skuId=3424&us=search",
        "isLogin": 0,
        "marketPrice": "",
        "nameLabel": null,
        "imageLabel": null,
        "extendList": null,
        "heytapInfo": null,
        "activityList": [
          {"type": 1, "activityInfo": "3期免息 "}
        ],
        "nameLabelWidth": null,
        "nameLabelHeight": null,
        "pricePrefix": null,
        "priceSuffix": null,
        "cardInfoType": null,
        "liveUrl": null,
        "storage": null,
        "seckill": null,
        "businessLink": null,
        "productDetailLabelss": null
      },
      {
        "skuId": 3423,
        "title": "realme 真我GT 5G 深海飞艇/12GB+256GB",
        "secondTitle": "",
        "thirdTitle": null,
        "url":
            "https://dsfs.oppo.com/archives/202103/20210304030319604086732bd9e.png?_w_=320&_h_=320",
        "jsonUrl": null,
        "video": null,
        "seq": null,
        "configKeyLattice": null,
        "latticeIndex": null,
        "configProductType": null,
        "isShowIcon": null,
        "topIcon": null,
        "cardType": null,
        "backColor": null,
        "liveInfoJson": null,
        "businessInfoJson": null,
        "price": 3299,
        "originalPrice": 3399,
        "categoryId": 34,
        "link":
            "https://store.oppo.com/cn/app/product/index?skuId=3423&us=search",
        "isLogin": 0,
        "marketPrice": "",
        "nameLabel": null,
        "imageLabel": null,
        "extendList": null,
        "heytapInfo": null,
        "activityList": [
          {"type": 1, "activityInfo": "3期免息 "}
        ],
        "nameLabelWidth": null,
        "nameLabelHeight": null,
        "pricePrefix": null,
        "priceSuffix": null,
        "cardInfoType": null,
        "liveUrl": null,
        "storage": null,
        "seckill": null,
        "businessLink": null,
        "productDetailLabelss": null
      },
      {
        "skuId": 3422,
        "title": "realme 真我GT 5G 银河战舰/12GB+256GB",
        "secondTitle": "",
        "thirdTitle": null,
        "url":
            "https://dsfs.oppo.com/archives/202103/202103040303026040866249a36.png?_w_=320&_h_=320",
        "jsonUrl": null,
        "video": null,
        "seq": null,
        "configKeyLattice": null,
        "latticeIndex": null,
        "configProductType": null,
        "isShowIcon": null,
        "topIcon": null,
        "cardType": null,
        "backColor": null,
        "liveInfoJson": null,
        "businessInfoJson": null,
        "price": 3299,
        "originalPrice": 3399,
        "categoryId": 34,
        "link":
            "https://store.oppo.com/cn/app/product/index?skuId=3422&us=search",
        "isLogin": 0,
        "marketPrice": "",
        "nameLabel": null,
        "imageLabel": null,
        "extendList": null,
        "heytapInfo": null,
        "activityList": [
          {"type": 1, "activityInfo": "3期免息 "}
        ],
        "nameLabelWidth": null,
        "nameLabelHeight": null,
        "pricePrefix": null,
        "priceSuffix": null,
        "cardInfoType": null,
        "liveUrl": null,
        "storage": null,
        "seckill": null,
        "businessLink": null,
        "productDetailLabelss": null
      },
      {
        "skuId": 3420,
        "title": "realme 真我GT 5G 深海飞艇/8GB+128GB",
        "secondTitle": "",
        "thirdTitle": null,
        "url":
            "https://dsfs.oppo.com/archives/202103/202103040303396040864b628ad.png?_w_=320&_h_=320",
        "jsonUrl": null,
        "video": null,
        "seq": null,
        "configKeyLattice": null,
        "latticeIndex": null,
        "configProductType": null,
        "isShowIcon": null,
        "topIcon": null,
        "cardType": null,
        "backColor": null,
        "liveInfoJson": null,
        "businessInfoJson": null,
        "price": 2799,
        "originalPrice": 2899,
        "categoryId": 34,
        "link":
            "https://store.oppo.com/cn/app/product/index?skuId=3420&us=search",
        "isLogin": 0,
        "marketPrice": "",
        "nameLabel": null,
        "imageLabel": null,
        "extendList": null,
        "heytapInfo": null,
        "activityList": [
          {"type": 1, "activityInfo": "3期免息 "}
        ],
        "nameLabelWidth": null,
        "nameLabelHeight": null,
        "pricePrefix": null,
        "priceSuffix": null,
        "cardInfoType": null,
        "liveUrl": null,
        "storage": null,
        "seckill": null,
        "businessLink": null,
        "productDetailLabelss": null
      }
    ],
    "link": null,
    "isLogin": null,
    "moreLink": null,
    "moreIsLogin": null
  }
];
