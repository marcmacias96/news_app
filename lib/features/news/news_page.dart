import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:new_app/data/news/models/news.dart';
import 'package:new_app/features/news/cubit/news_cubit.dart';
import 'package:new_app/features/news_details/news_details_page.dart';
import 'package:new_app/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  static const String routeName = 'news';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NewsCubit>()..getNews(),
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                'News App',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                    ),
              ),
            ),
            body: state.maybeMap(
              orElse: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
              error: (_) => const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text('Se ha producido un error inesperado'),
                  ),
                ],
              ),
              success: (success) {
                final news = success.news;
                return CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 12,
                      ),
                      sliver: SliverList.separated(
                        itemCount: news.length,
                        itemBuilder: (context, index) {
                          final article = news[index];
                          final format = DateFormat.yMEd();

                          return Article(article: article, format: format);
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Article extends StatelessWidget {
  const Article({
    super.key,
    required this.article,
    required this.format,
  });

  final News article;
  final DateFormat format;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.pushNamed(
        NewsDetailsPage.routeName,
        extra: article,
      ),
      leading: article.urlToImage != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 80,
                width: 80,
                child: Image.network(
                  article.urlToImage!,
                ),
              ),
            )
          : const Icon(Icons.photo),
      title: Text(article.title),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: article.author != null,
            child: Text(
              (article.author ?? "").contains('<') ? "" : article.author ?? "",
            ),
          ),
          Text(
            format.format(article.publishedAt),
          )
        ],
      ),
    );
  }
}
