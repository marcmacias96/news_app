import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_app/data/news/models/news.dart';

class NewsDetailsPage extends StatelessWidget {
  final News article;
  const NewsDetailsPage({
    super.key,
    required this.article,
  });

  static const String routeName = 'newsDetails';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final format = DateFormat.yMEd();

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: [
          if (article.urlToImage != null)
            SliverToBoxAdapter(
              child: Image.network(article.urlToImage!),
            ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    article.title,
                    style: textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: article.author != null,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            (article.author ?? "").contains('<')
                                ? ""
                                : article.author ?? "",
                          ),
                        ),
                      ),
                      Text(format.format(article.publishedAt))
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Wrap(
                children: [
                  Text(
                    article.content ?? "",
                    style: textTheme.bodyMedium,
                    maxLines: 200,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
