const categoryList = [
  {
    "id": "fu001",
    "name": "家具",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/fu001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/fu001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/fu001/icon.svg?v=10",
    "children": [
      {
        "id": "fu006",
        "name": "扶手椅和贵妃椅",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/fu006/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/fu006/banner.jpg?v=10",
      },
      {
        "id": "fu003",
        "name": "沙发",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/fu003/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/fu003/banner.jpg?v=10",
      },
      {
        "id": "19053",
        "name": "衣柜",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/19053/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/19053/banner.jpg?v=10",
      },
      {
        "id": "10664",
        "name": "备用沙发套",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10664/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10664/banner.jpg?v=10",
      },
      {
        "id": "st002",
        "name": "书柜和搁架单元",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st002/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st002/banner.jpg?v=10",
      },
      {
        "id": "10475",
        "name": "电视柜及视听类家具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10475/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10475/banner.jpg?v=10",
      },
      {
        "id": "st004",
        "name": "抽屉柜和抽屉框架",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st004/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st004/banner.jpg?v=10",
      },
      {
        "id": "30454",
        "name": "餐边柜和长几",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/30454/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/30454/banner.jpg?v=10",
      },
      {
        "id": "st003",
        "name": "橱柜和展示柜",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st003/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st003/banner.jpg?v=10",
      },
      {
        "id": "bm003",
        "name": "床",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/bm003/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/bm003/banner.jpg?v=10",
      },
      {
        "id": "fu004",
        "name": "桌子-书桌和餐桌",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/fu004/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/fu004/banner.jpg?v=10",
      },
      {
        "id": "16244",
        "name": "吧台家具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16244/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16244/banner.jpg?v=10",
      },
      {
        "id": "19141",
        "name": "咖啡馆家具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/19141/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/19141/banner.jpg?v=10",
      },
      {
        "id": "fu002",
        "name": "椅子",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/fu002/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/fu002/banner.jpg?v=10",
      },
      {
        "id": "od003",
        "name": "户外家具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/od003/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/od003/banner.jpg?v=10",
      },
      {
        "id": "18767",
        "name": "儿童家具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18767/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18767/banner.jpg?v=10",
      },
      {
        "id": "fu005",
        "name": "推车",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/fu005/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/fu005/banner.jpg?v=10",
      },
      {
        "id": "46080",
        "name": "房间隔断",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/46080/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/46080/banner.jpg?v=10",
      },
      {
        "id": "45780",
        "name": "婴儿家具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/45780/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/45780/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "ka001",
    "name": "橱柜和家电",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/ka001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/ka001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/ka001/icon.svg?v=10",
    "children": [
      {
        "id": "24255",
        "name": "内部配件",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24255/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24255/banner.jpg?v=10",
      },
      {
        "id": "20676",
        "name": "厨房壁式储物装置",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20676/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20676/banner.jpg?v=10",
      },
      {
        "id": "10471",
        "name": "推车和岛台",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10471/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10471/banner.jpg?v=10",
      },
      {
        "id": "22957",
        "name": "标配厨房",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/22957/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/22957/banner.jpg?v=10",
      },
      {
        "id": "ka002",
        "name": "厨房电器",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/ka002/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/ka002/banner.jpg?v=10",
      },
      {
        "id": "24254",
        "name": "厨房橱柜和前板",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24254/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24254/banner.jpg?v=10",
      },
      {
        "id": "24261",
        "name": "厨房水龙头和水槽",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24261/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24261/banner.jpg?v=10",
      },
      {
        "id": "24264",
        "name": "厨房操作台面",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24264/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24264/banner.jpg?v=10",
      },
      {
        "id": "16298",
        "name": "拉手和拉钮",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16298/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16298/banner.jpg?v=10",
      },
      {
        "id": "19121",
        "name": "墙面板",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/19121/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/19121/banner.jpg?v=10",
      },
      {
        "id": "16282",
        "name": "厨房照明",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16282/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16282/banner.jpg?v=10",
      },
      {
        "id": "16200",
        "name": "食品贮藏室",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16200/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16200/banner.jpg?v=10",
      },
      {
        "id": "ka003",
        "name": "厨房厨柜系列",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/ka003/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/ka003/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "st001",
    "name": "储物和收纳",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/st001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/st001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/st001/icon.svg?v=10",
    "children": [
      {
        "id": "46052",
        "name": "储物系统",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/46052/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/46052/banner.jpg?v=10",
      },
      {
        "id": "19053",
        "name": "衣柜",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/19053/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/19053/banner.jpg?v=10",
      },
      {
        "id": "st004",
        "name": "抽屉柜和抽屉框架",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st004/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st004/banner.jpg?v=10",
      },
      {
        "id": "st002",
        "name": "书柜和搁架单元",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st002/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st002/banner.jpg?v=10",
      },
      {
        "id": "st003",
        "name": "橱柜和展示柜",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st003/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st003/banner.jpg?v=10",
      },
      {
        "id": "10475",
        "name": "电视柜及视听类家具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10475/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10475/banner.jpg?v=10",
      },
      {
        "id": "30454",
        "name": "餐边柜和长几",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/30454/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/30454/banner.jpg?v=10",
      },
      {
        "id": "st005",
        "name": "鞋柜和衣帽架",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st005/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st005/banner.jpg?v=10",
      },
      {
        "id": "st006",
        "name": "挂钩和墙面收纳件",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st006/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st006/banner.jpg?v=10",
      },
      {
        "id": "st007",
        "name": "小型储物产品",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st007/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/st007/banner.jpg?v=10",
      },
      {
        "id": "fu005",
        "name": "推车",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/fu005/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/fu005/banner.jpg?v=10",
      },
      {
        "id": "16248",
        "name": "包袋",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16248/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16248/banner.jpg?v=10",
      },
      {
        "id": "46078",
        "name": "搬家用品",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/46078/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/46078/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "bm001",
    "name": "床和床垫",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/bm001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/bm001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/bm001/icon.svg?v=10",
    "children": [
      {
        "id": "bm003",
        "name": "床",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/bm003/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/bm003/banner.jpg?v=10",
      },
      {
        "id": "bm002",
        "name": "床垫",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/bm002/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/bm002/banner.jpg?v=10",
      },
      {
        "id": "19064",
        "name": "床头板",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/19064/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/19064/banner.jpg?v=10",
      },
      {
        "id": "20656",
        "name": "床头柜",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20656/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20656/banner.jpg?v=10",
      },
      {
        "id": "24827",
        "name": "床板条",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24827/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24827/banner.jpg?v=10",
      },
      {
        "id": "19059",
        "name": "床底收纳",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/19059/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/19059/banner.jpg?v=10",
      },
      {
        "id": "tl004",
        "name": "卧室纺织品",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/tl004/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/tl004/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "tl001",
    "name": "纺织品",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/tl001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/tl001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/tl001/icon.svg?v=10",
    "children": [
      {
        "id": "tl004",
        "name": "卧室纺织品",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/tl004/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/tl004/banner.jpg?v=10",
      },
      {
        "id": "tl003",
        "name": "浴室纺织品",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/tl003/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/tl003/banner.jpg?v=10",
      },
      {
        "id": "tl002",
        "name": "窗帘和卷帘",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/tl002/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/tl002/banner.jpg?v=10",
      },
      {
        "id": "10655",
        "name": "布料和缝纫用品",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10655/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10655/banner.jpg?v=10",
      },
      {
        "id": "10659",
        "name": "靠垫和靠垫套",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10659/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10659/banner.jpg?v=10",
      },
      {
        "id": "18850",
        "name": "厨房纺织品",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18850/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18850/banner.jpg?v=10",
      },
      {
        "id": "18690",
        "name": "婴儿纺织品",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18690/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18690/banner.jpg?v=10",
      },
      {
        "id": "18730",
        "name": "儿童纺织品",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18730/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18730/banner.jpg?v=10",
      },
      {
        "id": "20538",
        "name": "餐桌用纺织品",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20538/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20538/banner.jpg?v=10",
      },
      {
        "id": "17893",
        "name": "户外靠垫",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/17893/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/17893/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "bc001",
    "name": "婴儿和儿童",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/bc001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/bc001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/bc001/icon.svg?v=10",
    "children": [
      {
        "id": "bc002",
        "name": "婴儿",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/bc002/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/bc002/banner.jpg?v=10",
      },
      {
        "id": "bc003",
        "name": "儿童",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/bc003/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/bc003/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "ba001",
    "name": "浴室产品",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/ba001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/ba001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/ba001/icon.svg?v=10",
    "children": [
      {
        "id": "46079",
        "name": "浴室家具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/46079/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/46079/banner.jpg?v=10",
      },
      {
        "id": "20719",
        "name": "洗脸池",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20719/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20719/banner.jpg?v=10",
      },
      {
        "id": "20802",
        "name": "浴室用柜",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20802/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20802/banner.jpg?v=10",
      },
      {
        "id": "20490",
        "name": "浴室镜",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20490/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20490/banner.jpg?v=10",
      },
      {
        "id": "10555",
        "name": "浴室配件",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10555/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10555/banner.jpg?v=10",
      },
      {
        "id": "20859",
        "name": "浴室脚凳和长凳",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20859/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20859/banner.jpg?v=10",
      },
      {
        "id": "40690",
        "name": "花洒",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/40690/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/40690/banner.jpg?v=10",
      },
      {
        "id": "20724",
        "name": "浴室水龙头",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20724/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20724/banner.jpg?v=10",
      },
      {
        "id": "20723",
        "name": "浴室水槽",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20723/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20723/banner.jpg?v=10",
      },
      {
        "id": "tl003",
        "name": "浴室纺织品",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/tl003/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/tl003/banner.jpg?v=10",
      },
      {
        "id": "10736",
        "name": "浴室照明",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10736/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10736/banner.jpg?v=10",
      },
      {
        "id": "ba002",
        "name": "浴室储物",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/ba002/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/ba002/banner.jpg?v=10",
      },
      {
        "id": "ba003",
        "name": "浴室衣物洗涤及晾晒",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/ba003/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/ba003/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "kt001",
    "name": "餐具和厨具",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/kt001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/kt001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/kt001/icon.svg?v=10",
    "children": [
      {
        "id": "kt003",
        "name": "锅具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/kt003/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/kt003/banner.jpg?v=10",
      },
      {
        "id": "kt002",
        "name": "烹饪用具和烘培工具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/kt002/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/kt002/banner.jpg?v=10",
      },
      {
        "id": "15934",
        "name": "刀具和砧板",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/15934/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/15934/banner.jpg?v=10",
      },
      {
        "id": "18860",
        "name": "餐具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18860/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18860/banner.jpg?v=10",
      },
      {
        "id": "18865",
        "name": "刀叉餐具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18865/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18865/banner.jpg?v=10",
      },
      {
        "id": "18868",
        "name": "玻璃器皿和水壶",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18868/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18868/banner.jpg?v=10",
      },
      {
        "id": "16043",
        "name": "上菜用具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16043/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16043/banner.jpg?v=10",
      },
      {
        "id": "18714",
        "name": "儿童厨具和餐具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18714/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18714/banner.jpg?v=10",
      },
      {
        "id": "16044",
        "name": "咖啡和茶",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16044/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16044/banner.jpg?v=10",
      },
      {
        "id": "20538",
        "name": "餐桌用纺织品",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20538/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20538/banner.jpg?v=10",
      },
      {
        "id": "18850",
        "name": "厨房纺织品",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18850/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18850/banner.jpg?v=10",
      },
      {
        "id": "15937",
        "name": "食品收纳与储存罐",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/15937/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/15937/banner.jpg?v=10",
      },
      {
        "id": "20560",
        "name": "餐巾纸和纸巾架",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20560/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20560/banner.jpg?v=10",
      },
      {
        "id": "15938",
        "name": "洗碗用具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/15938/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/15938/banner.jpg?v=10",
      },
      {
        "id": "20636",
        "name": "烘焙器具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20636/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20636/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "li001",
    "name": "灯具照明",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/li001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/li001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/li001/icon.svg?v=10",
    "children": [
      {
        "id": "14971",
        "name": "装饰性灯具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/14971/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/14971/banner.jpg?v=10",
      },
      {
        "id": "li002",
        "name": "灯具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/li002/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/li002/banner.jpg?v=10",
      },
      {
        "id": "36812",
        "name": "智能照明",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/36812/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/36812/banner.jpg?v=10",
      },
      {
        "id": "10744",
        "name": "LED照明灯泡",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10744/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10744/banner.jpg?v=10",
      },
      {
        "id": "17897",
        "name": "户外照明",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/17897/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/17897/banner.jpg?v=10",
      },
      {
        "id": "16280",
        "name": "内置灯具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16280/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16280/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "de001",
    "name": "装饰品",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/de001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/de001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/de001/icon.svg?v=10",
    "children": [
      {
        "id": "10760",
        "name": "蜡烛和蜡台",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10760/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10760/banner.jpg?v=10",
      },
      {
        "id": "10757",
        "name": "图片和框架",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10757/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10757/banner.jpg?v=10",
      },
      {
        "id": "pp003",
        "name": "人造植物和人造花",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/pp003/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/pp003/banner.jpg?v=10",
      },
      {
        "id": "pp004",
        "name": "花盆",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/pp004/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/pp004/banner.jpg?v=10",
      },
      {
        "id": "42926",
        "name": "家用香氛",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/42926/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/42926/banner.jpg?v=10",
      },
      {
        "id": "25227",
        "name": "纸品屋",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/25227/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/25227/banner.jpg?v=10",
      },
      {
        "id": "24924",
        "name": "装饰配件",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24924/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24924/banner.jpg?v=10",
      },
      {
        "id": "10759",
        "name": "时钟",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10759/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10759/banner.jpg?v=10",
      },
      {
        "id": "20489",
        "name": "镜子",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20489/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20489/banner.jpg?v=10",
      },
      {
        "id": "10550",
        "name": "储物盒和储物篮",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10550/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10550/banner.jpg?v=10",
      },
      {
        "id": "10574",
        "name": "布告板",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10574/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10574/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "od001",
    "name": "户外产品",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/od001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/od001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/od001/icon.svg?v=10",
    "children": [
      {
        "id": "od003",
        "name": "户外家具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/od003/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/od003/banner.jpg?v=10",
      },
      {
        "id": "24898",
        "name": "烧烤",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24898/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24898/banner.jpg?v=10",
      },
      {
        "id": "17887",
        "name": "遮阳伞&亭子",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/17887/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/17887/banner.jpg?v=10",
      },
      {
        "id": "34204",
        "name": "户外地毯",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/34204/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/34204/banner.jpg?v=10",
      },
      {
        "id": "31787",
        "name": "户外花盆和植物",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/31787/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/31787/banner.jpg?v=10",
      },
      {
        "id": "34203",
        "name": "户外配件",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/34203/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/34203/banner.jpg?v=10",
      },
      {
        "id": "17893",
        "name": "户外靠垫",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/17893/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/17893/banner.jpg?v=10",
      },
      {
        "id": "17897",
        "name": "户外照明",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/17897/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/17897/banner.jpg?v=10",
      },
      {
        "id": "21957",
        "name": "户外地板",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/21957/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/21957/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "pt001",
    "name": "宠物用品",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/pt001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/pt001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/pt001/icon.svg?v=10",
    "children": [
      {
        "id": "39569",
        "name": "猫",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/39569/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/39569/banner.jpg?v=10",
      },
      {
        "id": "39570",
        "name": "狗",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/39570/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/39570/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "rm001",
    "name": "地毯, 门垫和地板",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/rm001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/rm001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/rm001/icon.svg?v=10",
    "children": [
      {
        "id": "10653",
        "name": "地毯",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10653/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10653/banner.jpg?v=10",
      },
      {
        "id": "20519",
        "name": "浴室垫子",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20519/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20519/banner.jpg?v=10",
      },
      {
        "id": "10698",
        "name": "门垫",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10698/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/10698/banner.jpg?v=10",
      },
      {
        "id": "21957",
        "name": "户外地板",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/21957/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/21957/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "he001",
    "name": "家用电子产品",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/he001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/he001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/he001/icon.svg?v=10",
    "children": [
      {
        "id": "he002",
        "name": "智能家居",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/he002/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/he002/banner.jpg?v=10",
      },
      {
        "id": "ka002",
        "name": "厨房电器",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/ka002/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/ka002/banner.jpg?v=10",
      },
      {
        "id": "40845",
        "name": "电线和充电器",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/40845/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/40845/banner.jpg?v=10",
      },
      {
        "id": "40842",
        "name": "扬声器",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/40842/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/40842/banner.jpg?v=10",
      },
      {
        "id": "40843",
        "name": "手机/平板配件",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/40843/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/40843/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "lc001",
    "name": "清洁及晾晒用品",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/lc001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/lc001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/lc001/icon.svg?v=10",
    "children": [
      {
        "id": "20609",
        "name": "清洁配件",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20609/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20609/banner.jpg?v=10",
      },
      {
        "id": "20602",
        "name": "晾衣架",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20602/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20602/banner.jpg?v=10",
      },
      {
        "id": "20601",
        "name": "洗衣篮",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20601/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20601/banner.jpg?v=10",
      },
      {
        "id": "20608",
        "name": "烫衣板",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20608/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20608/banner.jpg?v=10",
      },
      {
        "id": "15938",
        "name": "洗碗用具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/15938/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/15938/banner.jpg?v=10",
      },
      {
        "id": "16213",
        "name": "废纸篓和储物袋",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16213/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16213/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "pp001",
    "name": "花盆和植物",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/pp001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/pp001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/pp001/icon.svg?v=10",
    "children": [
      {
        "id": "pp004",
        "name": "花盆",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/pp004/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/pp004/banner.jpg?v=10",
      },
      {
        "id": "pp003",
        "name": "人造植物和人造花",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/pp003/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/pp003/banner.jpg?v=10",
      },
      {
        "id": "20494",
        "name": "植物支撑架和移动用具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20494/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20494/banner.jpg?v=10",
      },
      {
        "id": "20493",
        "name": "浇水壶",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20493/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/20493/banner.jpg?v=10",
      },
      {
        "id": "24887",
        "name": "园艺配件",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24887/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24887/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "lt001",
    "name": "休闲和旅游",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/lt001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/lt001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/lt001/icon.svg?v=10",
    "children": [
      {
        "id": "16248",
        "name": "包袋",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16248/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16248/banner.jpg?v=10",
      },
      {
        "id": "24847",
        "name": "游戏/休闲",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24847/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/24847/banner.jpg?v=10",
      },
      {
        "id": "25227",
        "name": "纸品屋",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/25227/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/25227/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "sp001",
    "name": "安全产品",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/sp001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/sp001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/sp001/icon.svg?v=10",
    "children": [
      {
        "id": "16257",
        "name": "儿童安全",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16257/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16257/banner.jpg?v=10",
      },
      {
        "id": "16256",
        "name": "居家安全",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16256/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16256/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "hi001",
    "name": "家居修缮",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/hi001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/hi001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/hi001/icon.svg?v=10",
    "children": [
      {
        "id": "16298",
        "name": "拉手和拉钮",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16298/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16298/banner.jpg?v=10",
      },
      {
        "id": "42948",
        "name": "护理油/着色剂/产品保养",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/42948/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/42948/banner.jpg?v=10",
      },
      {
        "id": "21957",
        "name": "户外地板",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/21957/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/21957/banner.jpg?v=10",
      },
      {
        "id": "46077",
        "name": "吸音板",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/46077/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/46077/banner.jpg?v=10",
      },
      {
        "id": "46078",
        "name": "搬家用品",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/46078/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/46078/banner.jpg?v=10",
      },
      {
        "id": "16292",
        "name": "工具和安装件",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16292/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16292/banner.jpg?v=10",
      },
      {
        "id": "16249",
        "name": "安全产品",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16249/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/16249/banner.jpg?v=10",
      },
      {
        "id": "19121",
        "name": "墙面板",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/19121/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/19121/banner.jpg?v=10",
      }
    ]
  },
  {
    "id": "wt001",
    "name": "冬季节日",
    "icon":
        "https://res-qa.app.ikea.cn/static/public/catalog/wt001/thumbnail.png?v=10",
    "bannerImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/wt001/banner.jpg?v=10",
    "iconImg":
        "https://res-qa.app.ikea.cn/static/public/catalog/wt001/icon.svg?v=10",
    "children": [
      {
        "id": "18734",
        "name": "玩具和玩耍",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18734/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/18734/banner.jpg?v=10",
      },
      {
        "id": "14971",
        "name": "装饰性灯具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/14971/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/14971/banner.jpg?v=10",
      },
      {
        "id": "49227",
        "name": "假日美味",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/49227/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/49227/banner.jpg?v=10",
      },
      {
        "id": "49154",
        "name": "冬季烹饪和烘焙",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/49154/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/49154/banner.jpg?v=10",
      },
      {
        "id": "49150",
        "name": "冬季照明",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/49150/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/49150/banner.jpg?v=10",
      },
      {
        "id": "49152",
        "name": "冬季纺织品",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/49152/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/49152/banner.jpg?v=10",
      },
      {
        "id": "49151",
        "name": "冬季花盆和绿植",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/49151/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/49151/banner.jpg?v=10",
      },
      {
        "id": "49149",
        "name": "冬季装饰",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/49149/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/49149/banner.jpg?v=10",
      },
      {
        "id": "49153",
        "name": "冬季餐具",
        "icon":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/49153/thumbnail.png?v=10",
        "bannerImg":
            "https://res-qa.app.ikea.cn/static/public/subcatalog/49153/banner.jpg?v=10",
      }
    ]
  }
];
