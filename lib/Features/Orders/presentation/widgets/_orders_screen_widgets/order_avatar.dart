import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OrderAvatar extends StatelessWidget {
  final String imageUrl;
  const OrderAvatar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: 60,
        height: 80,
        fit: BoxFit.cover,
        placeholder: (context, url) => Center(
          child: const CircularProgressIndicator(
            color: Colors.indigo,
          ),
        ),
        errorWidget: (context, url, error) =>
            const Icon(Icons.error, size: 50, color: Colors.red),
      ),
    );
  }
}
