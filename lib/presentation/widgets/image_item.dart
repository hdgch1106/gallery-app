import 'package:flutter/material.dart';
import 'package:gallery_app/domain/domain.dart';
import 'package:go_router/go_router.dart';

class ImageItem extends StatelessWidget {
  final PhotoEntity photo;
  const ImageItem({
    super.key,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push("/inicio/image", extra: photo.urls.regular),
      child: Image.network(
        photo.urls.regular,
        height: 50,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
        },
      ),
    );
  }
}
