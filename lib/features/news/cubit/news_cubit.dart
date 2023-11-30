import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:new_app/data/news/models/news.dart';
import 'package:new_app/data/news/news_repository.dart';

part 'news_state.dart';
part 'news_cubit.freezed.dart';

@injectable
class NewsCubit extends Cubit<NewsState> {
  final NewsRepository _newsRepository;
  NewsCubit(this._newsRepository) : super(const NewsState.initial());

  Future<void> getNews() async {
    emit(const NewsState.loading());
    final failureOrNews = await _newsRepository.getNews();
    failureOrNews.fold(
      (failure) => emit(const NewsState.error()),
      (news) => emit(NewsState.success(news: news)),
    );
  }
}
