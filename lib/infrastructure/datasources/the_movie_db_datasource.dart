import 'package:dio/dio.dart';
import 'package:movies/config/constants/environment.dart';
import 'package:movies/domain/datasources/movies_datasource.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/infrastructure/mappers/movie_mapper.dart';
import 'package:movies/infrastructure/models/moviedb/moviedb_response.dart';

class TheMovieDBDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl:
          '${Environment.theMovieDBBaseURL}/${Environment.theMovieDBAPIVersion}',
      headers: {'Authorization': Environment.theMovieDBAccessKey}));
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final moviDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = moviDBResponse.results
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
    return movies;
  }
}
