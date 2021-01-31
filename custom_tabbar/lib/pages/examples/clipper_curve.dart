import 'package:flutter/material.dart';

class ClipperCurve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('贝塞尔曲线'),
        ),
        body: Column(
          children: [
            ClipPath(
              clipper: BottomClipper(),
              child: Container(
                color: Colors.deepPurpleAccent,
                height: 200.0,
              ),
            )
          ],
        ));
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30);
    // 二次贝塞尔曲线
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var twoControlPoint = Offset(size.width / 4 * 3, size.height - 80);
    var twoEndPoint = Offset(size.width, size.height - 40);

    // 二次贝塞尔曲线
    path.quadraticBezierTo(
        twoControlPoint.dx, twoControlPoint.dy, twoEndPoint.dx, twoEndPoint.dy);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
