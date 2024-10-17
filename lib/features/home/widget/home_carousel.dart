// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:news_application/features/home/home_model/top_headlines_response.dart';

class HomeCarousel extends StatelessWidget {
  final List<Article> topHeadlines;
  const HomeCarousel({
    Key? key,
    required this.topHeadlines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: topHeadlines.isNotEmpty
          ? CarouselView(
              itemExtent: 330,
              shrinkExtent: 200,
              children: List<Widget>.generate(topHeadlines.length, (int index) {
                final topHeadline = topHeadlines[index];

                return Container(
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          topHeadline.urlToImage ?? ''),
                      onError: (exception, stackTrace) => CachedNetworkImage(
                          imageUrl:
                              'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 8,
                      right: 16,
                      left: 16,
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        topHeadline.title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                );
              }),
            )
          : const Text('No Data!'),
    );
  }
}
