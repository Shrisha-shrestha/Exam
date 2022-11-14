import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCacheNetworkImage extends StatelessWidget {
  const CustomCacheNetworkImage({
    super.key,
    this.height,
    this.width,
    required this.url,
    this.fit,
  });
  final double? height;
  final double? width;
  final String? url;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      imageUrl: url ??
          'https://icon-library.com/images/no-picture-available-icon/no-picture-available-icon-1.jpg',
      imageBuilder: (__, imageProvider) {
        return InkWell(
          onTap: () {},
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: imageProvider,
                fit: fit ?? BoxFit.cover,
              ),
            ),
          ),
        );
      },
      placeholder: (__, url) => Container(
        decoration: BoxDecoration(color: Colors.grey[300]),
        height: height,
        width: width,
        child: const Center(child: CupertinoActivityIndicator()),
      ),
      errorWidget: (__, url, error) => SizedBox(
        height: height,
        width: width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey[500],
            image: DecorationImage(
              image: const CachedNetworkImageProvider(
                'https://icon-library.com/images/no-picture-available-icon/no-picture-available-icon-1.jpg',
              ),
              fit: fit ?? BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({super.key, this.radius = 30, required this.url});

  final double radius;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius * 2),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.white,
        child: CustomCacheNetworkImage(
          url: url,
          height: radius * 2,
          width: radius * 2,
        ),
      ),
    );
  }
}
