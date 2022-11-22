import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pusatani/base/base_controller.dart';
import 'package:pusatani/data/model/list_article_model.dart';

class InfiniteScrollController extends BaseController {
  static const limit = 5;
  ListArticleModel? listArticleModel = ListArticleModel();

  final PagingController<int, Data1> pagingController =
      PagingController(firstPageKey: 0);
  @override
  void onInit() {
    super.onInit();

    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await repository.getListArticle(pageKey);
      listArticleModel = newItems;
      final isLastPage = newItems!.data!.total! < newItems.data!.perPage!;
      if (isLastPage) {
        pagingController.appendLastPage(newItems.data!.data!);
      } else {
        final nextPageKey = pageKey + newItems.data!.data!.length;
        pagingController.appendPage(newItems.data!.data!, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}
