import 'package:movies/domain/entities/movie.dart';

abstract class LocalStorageDarasource {
  Future<void> toggleFavorite(Movie movie);
  Future<bool> isMovieFavorite(int movieId);
  Future<List<Movie>> loadMovies({int limit = 10, offset = 0});
}
