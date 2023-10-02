import 'package:bookly_app/model/book_model/book_model.dart';
import 'package:bookly_app/view_model/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Faliure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Faliure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Faliure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
  Future<Either<Faliure, List<BookModel>>> fetchSearchBooks(
      {required String searchEndpoint});
}
