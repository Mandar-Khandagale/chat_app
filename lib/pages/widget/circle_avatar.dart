import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    Key? key,
    required this.radius,
    required this.url,
  }) : super(key: key);

  const CustomCircleAvatar.small({
    Key? key,
    this.radius = 16.0,
    required this.url,
  }) : super(key: key);

  const CustomCircleAvatar.medium({
    Key? key,
    this.radius = 22.0,
    required this.url,
  }) : super(key: key);

  const CustomCircleAvatar.large({
    Key? key,
    this.radius = 28.0,
    required this.url,
  }) : super(key: key);

  const CustomCircleAvatar.xlarge({
    Key? key,
    this.radius = 44.0,
    required this.url,
  }) : super(key: key);


  final double radius;
  final String url;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Theme.of(context).cardColor,
      backgroundImage: CachedNetworkImageProvider(url),
    );
  }
}
