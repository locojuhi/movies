import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/infrastructure/datasources/the_movie_db_datasource.dart';
import 'package:movies/infrastructure/repositories/movie_repository_impl.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(TheMovieDBDatasource());
});
