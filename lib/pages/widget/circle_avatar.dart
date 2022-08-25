import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({
    Key? key,
     required this.radius,
     this.url,
    this.onTap
  }) : super(key: key);

  const CustomCircleAvatar.small({
    Key? key,
    this.radius = 16.0,
     this.url,
    this.onTap
  }) : super(key: key);

  const CustomCircleAvatar.medium({
    Key? key,
    this.radius = 22.0,
     this.url,
    this.onTap
  }) : super(key: key);

  const CustomCircleAvatar.large({
    Key? key,
    this.radius = 28.0,
     this.url,
    this.onTap
  }) : super(key: key);

  const CustomCircleAvatar.xlarge({
    Key? key,
    this.radius = 44.0,
    this.url,
    this.onTap
  }) : super(key: key);


  final double radius;
  final String? url;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: url != null
          ? CircleAvatar(
              radius: radius,
              backgroundColor: Theme.of(context).cardColor,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Image.network(
                  url!,
                  errorBuilder: (context, obj, _) {
                    return const Center(
                      child: FlutterLogo(),
                    );
                  },
                ),
              ),
            )
          : CircleAvatar(
              radius: radius,
              backgroundColor: Theme.of(context).cardColor,
              child: const Center(
                child: FlutterLogo(),
              ),
            ),
    );
  }
}
