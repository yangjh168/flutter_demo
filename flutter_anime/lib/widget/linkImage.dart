import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LinkImage extends StatelessWidget {
  final String url;

  const LinkImage({Key key, @required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "$url",
      placeholder: (context, url) => Center(
        child: Container(
          width: 50.0.w,
          height: 50.0.w,
          child: Image.asset('assets/image/img-default.png'),
        ),
        // child: Center(
        //   child: CircularProgressIndicator(
        //     strokeWidth: 2,
        //   ),
        // ),
      ),
      errorWidget: (context, url, error) => Center(
        child: Container(
          width: 80.0.w,
          height: 80.0.w,
          child: Image.asset('assets/image/img-error.png'),
        ),
      ),
    );
  }
}
