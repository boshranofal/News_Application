// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:news_application/features/home/home_model/top_headlines_response.dart';

class HomeListNews extends StatelessWidget {
  final List<Article> topHeadlines;
  const HomeListNews({
    Key? key,
    required this.topHeadlines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const SizedBox(height: 6),
      itemBuilder: (_, index) {
        return Card(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: topHeadlines[index].urlToImage ?? '',
                fit: BoxFit.cover,
                height: 80,
                width: 80,
                errorWidget: (context, url, error) => CachedNetworkImage(
                  imageUrl:
                      'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
                ),
              ),
            ),
            title: Text(
              topHeadlines[index].title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            subtitle: Text(
              topHeadlines[index].description ??
                  topHeadlines[index].content ??
                  '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.grey,
                  ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined),
            ),
          ),
        );
      },
      itemCount: topHeadlines.length,
    );
  }
}
