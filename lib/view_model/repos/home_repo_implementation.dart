import 'package:bookly_app/model/book_model/book_model.dart';
import 'package:bookly_app/view_model/database/network/dio_helper.dart';
import 'package:bookly_app/view_model/database/network/end_point.dart';
import 'package:bookly_app/view_model/errors/failures.dart';
import 'package:bookly_app/view_model/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepImpl implements HomeRepo {
  final DioHelper dioHelper;
  HomeRepImpl(this.dioHelper);

  @override
  Future<Either<Faliure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await dioHelper.get(endPoint: EndPoints.newestBooksEndpoint);
      List<BookModel> bookList = [];
      for (var item in data['items']) {
        if (BookModel.fromJson(item).volumeInfo?.imageLinks?.thumbnail ==
                null ||
            BookModel.fromJson(item).volumeInfo?.title! == null) {
          continue;
        }
        bookList.add(BookModel.fromJson(item));
      }
      return right(bookList);
    } on Exception catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await dioHelper.get(endPoint: EndPoints.featuredBooksEndpoint);
      List<BookModel> bookList = [];
      for (var item in data['items']) {
        if (BookModel.fromJson(item).volumeInfo?.imageLinks?.thumbnail ==
            null) {
          continue;
        }
        bookList.add(BookModel.fromJson(item));
      }
      return right(bookList);
    } on Exception catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await dioHelper.get(endPoint: EndPoints.similarBooks);
      List<BookModel> bookList = [];
      for (var item in data['items']) {
        if (BookModel.fromJson(item).volumeInfo?.imageLinks?.thumbnail ==
            null) {
          continue;
        }
        bookList.add(BookModel.fromJson(item));
      }
      return right(bookList);
    } on Exception catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Faliure, List<BookModel>>> fetchSearchBooks(
      {required String searchEndpoint}) async {
    try {
      var data = await dioHelper.get(endPoint: searchEndpoint);
      List<BookModel> bookList = [];
      for (var item in data['items']) {
        if (BookModel.fromJson(item).volumeInfo?.imageLinks?.thumbnail ==
            null) {
          continue;
        }
        bookList.add(BookModel.fromJson(item));
      }
      return right(bookList);
    } on Exception catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
