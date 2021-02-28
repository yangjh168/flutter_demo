const bannerList = [
  'http://m.360buyimg.com/mobilecms/s700x280_jfs/t1/159705/1/8162/113888/6033a795E5f0d4692/12d31b57e48e4706.jpg!q70.jpg.dpg',
  'http://m.360buyimg.com/mobilecms/s700x280_jfs/t1/150713/13/20129/175829/602f862eE6bde295f/bd469d05c3a4075e.jpg!cr_1125x445_0_171!q70.jpg.dpg',
  'http://m.360buyimg.com/mobilecms/s700x280_jfs/t1/123624/24/2195/99979/5ec3a165E12b276e2/2e5b8a2606fbabfe.jpg!q70.jpg.dpg',
  'http://m.360buyimg.com/mobilecms/s700x280_jfs/t1/156744/4/10960/130882/6034c96aEe021315b/fc70444d19aca670.jpg!q70.jpg.dpg',
];

// 首页导航菜单
const gridList = [
  {
    'name': '白酒',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/125678/35/5947/4868/5efbf28cEbf04a25a/e2bcc411170524f0.png'
  },
  {
    'name': '啤酒',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/135931/4/3281/5598/5efbf2c0Edbdc82c7/ed9861b4ddfb9f30.png'
  },
  {
    'name': '葡萄酒',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/140012/8/1804/3641/5efbf318E38bd5dad/0db99d859ab16ce9.png'
  },
  {
    'name': '洋酒',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/129215/21/5978/3618/5efbf344Ebec23ae8/59712d986b10bb0a.png'
  },
  {
    'name': '保健酒',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/116602/7/11200/3796/5efbf375Ebba41029/f07cc166f368fa05.png'
  },
  {
    'name': '预调酒',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/146390/3/1846/4909/5efbf39aEe5f5f797/300071558a9ab078.png.webp'
  },
  {
    'name': '下酒小菜',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/150351/19/14167/6853/5fed882dE195ef673/b2aa7d67e675baf8.png.webp'
  },
  {
    'name': '饮料',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/113589/24/11332/4897/5efbf3feE705d87db/e5c12d5e943266b9.png.webp'
  },
  {
    'name': '乳制品',
    'nav':
        'http://m.360buyimg.com/mobilecms/s120x120_jfs/t1/131663/33/3380/3674/5efbf50fEf79cf314/af4b57d2383e605d.png.webp'
  },
  {
    'name': '休闲零食',
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
    'image':
        'http://img11.360buyimg.com/n7/s150x150_jfs/t1/159008/30/6738/137611/6020c2d0Efe4465c1/59e519826d9c74a9.jpg.dpg',
    'mallPrice': '18.5',
    'price': '26.8',
    'name': '超级商品'
  },
  {
    'image':
        'http://img11.360buyimg.com/n7/s150x150_jfs/t1/154157/25/16429/150418/601d0138Ef57c8ded/384b6ca62f6cf9de.jpg',
    'mallPrice': '18.5',
    'price': '26.8',
    'name': '超级商品'
  },
  {
    'image':
        'http://img11.360buyimg.com/n7/s150x150_jfs/t1/155285/4/18202/128283/602f2b22E8b6d34b7/58b21dfa476ef446.jpg.dpg',
    'mallPrice': '18.5',
    'price': '26.8',
    'name': '超级商品'
  },
  {
    'image':
        'http://img11.360buyimg.com/n7/s150x150_jfs/t1/159008/30/6738/137611/6020c2d0Efe4465c1/59e519826d9c74a9.jpg.dpg',
    'mallPrice': '18.5',
    'price': '26.8',
    'name': '超级商品'
  },
  {
    'image':
        'http://img11.360buyimg.com/n7/s150x150_jfs/t1/154157/25/16429/150418/601d0138Ef57c8ded/384b6ca62f6cf9de.jpg.dpg',
    'mallPrice': '18.5',
    'price': '26.8',
    'name': '超级商品'
  },
  {
    'image':
        'http://img11.360buyimg.com/n7/s150x150_jfs/t1/155285/4/18202/128283/602f2b22E8b6d34b7/58b21dfa476ef446.jpg.dpg',
    'mallPrice': '18.5',
    'price': '26.8',
    'name': '超级商品'
  },
];
