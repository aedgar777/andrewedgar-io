import 'package:flutter/material.dart';

import '../utils.dart';

class PortfolioItem extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String tags;
  final String link;

  const PortfolioItem({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.tags,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme
        .of(context)
        .textTheme;
    List<String> tagList = tags.split(',').map((tag) => tag.trim()).toList();

    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () => launchURL(link),
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[800],
                        alignment: Alignment.center,
                        child: const Icon(Icons.broken_image_outlined,
                            color: Colors.grey, size: 48),
                      );
                    },
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme
                                  .of(context)
                                  .colorScheme
                                  .primary),
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(title,
                  style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  description,
                  style: textTheme.bodyMedium?.copyWith(
                      color: Colors.black.withOpacity(0.7))
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 6.0,
                runSpacing: 4.0,
                children: tagList
                    .map((tag) =>
                    Chip(
                      label: Text(tag,
                          style: TextStyle(color: Colors.white.withOpacity(
                              0.9))),
                      backgroundColor: Theme
                          .of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.7),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2.0),
                      labelStyle: const TextStyle(fontSize: 12),
                    ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}