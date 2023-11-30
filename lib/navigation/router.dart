import 'package:go_router/go_router.dart';
import 'package:new_app/data/news/models/news.dart';
import 'package:new_app/features/news/news_page.dart';
import 'package:new_app/features/news_details/news_details_page.dart';

GoRouter getGoRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: NewsPage.routeName,
        builder: (context, state) => const NewsPage(),
      ),
      GoRoute(
        path: '/${NewsDetailsPage.routeName}',
        name: NewsDetailsPage.routeName,
        builder: (context, state) {
          final news = state.extra as News;
          return NewsDetailsPage(
            article: news,
          );
        },
      )
    ],
  );
}
