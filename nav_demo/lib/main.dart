import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  Product(this.title, this.description);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '导航的数据传递与接收',
      home: new Scaffold(
        appBar: new AppBar(title: new Text('nav-demo')),
        body: ProductList(
            products: List.generate(
                20, (index) => Product("商品 $index", "这是一个商品详情，编号为：$index"))),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({Key key, @required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(products[index].title),
              onTap: () {
                _navigateDetail(context, products[index]);
              },
            );
          }),
    );
  }

  void _navigateDetail(BuildContext context, Product product) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetail(product: product)));
    if (result != null) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
    }
  }
}

class ProductDetail extends StatelessWidget {
  final Product product;
  ProductDetail({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${product.title}')),
        body: Center(
            child: Column(
          children: <Widget>[
            Image.asset('images/xiaojiejie.jpg'),
            RaisedButton(
                child: Text('大长腿小姐姐'),
                onPressed: () {
                  Navigator.pop(context, '你选择了：大长腿小姐姐');
                }),
            RaisedButton(
                child: Text('小蛮腰小姐姐'),
                onPressed: () {
                  Navigator.pop(context, '你选择了：小蛮腰小姐姐');
                }),
            RaisedButton(
                child: Text('萝莉小姐姐'),
                onPressed: () {
                  Navigator.pop(context, '你选择了：萝莉小姐姐');
                }),
          ],
        )));
  }
}
