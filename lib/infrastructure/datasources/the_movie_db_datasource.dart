import 'package:dio/dio.dart';
import 'package:movies/config/constants/environment.dart';
import 'package:movies/domain/datasources/movies_datasource.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/infrastructure/mappers/movie_mapper.dart';
import 'package:movies/infrastructure/models/moviedb/movie_details.dart';
import 'package:movies/infrastructure/models/moviedb/moviedb_response.dart';

class TheMovieDBDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl:
          '${Environment.theMovieDBBaseURL}/${Environment.theMovieDBAPIVersion}',
      headers: {'Authorization': Environment.theMovieDBAccessKey}));
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    final moviDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = moviDBResponse.results
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    final moviDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = moviDBResponse.results
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    final moviDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = moviDBResponse.results
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    final moviDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = moviDBResponse.results
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
    return movies;
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get(
      '/movie/$id',
    );

    if (response.statusCode != 200) {
      throw Exception('Movie with id $id not found');
    }

    final moviDBResponse = MovieDetails.fromJson(response.data);
    final movie = MovieMapper.movieDetailsToEntity(moviDBResponse);

    return movie;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    if (query.isEmpty) return [];
    final response =
        await dio.get('/search/movie', queryParameters: {'query': query});
    final moviDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = moviDBResponse.results
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();
    return movies;
  }
}
