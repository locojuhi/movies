import 'package:dio/dio.dart';
import 'package:movies/domain/datasources/actors_datasource.dart';
import 'package:movies/domain/entities/actor.dart';
import 'package:movies/config/constants/environment.dart';
import 'package:movies/infrastructure/mappers/actor_mapper.dart';
import 'package:movies/infrastructure/models/moviedb/credits_response.dart';

class ActorMoviedbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl:
          '${Environment.theMovieDBBaseURL}/${Environment.theMovieDBAPIVersion}',
      headers: {'Authorization': Environment.theMovieDBAccessKey}));

  @override
  Future<List<Actor>> getActorsByMovie(String movideId) async {
    final response = await dio.get(
      '/movie/$movideId/credits',
    );

    final castResponse = CreditsResponse.fromJson(response.data);

    final List<Actor> actors = castResponse.cast
        .map((actor) => ActorMapper.casToEntity(actor))
        .toList();

    return actors;
  }
}
