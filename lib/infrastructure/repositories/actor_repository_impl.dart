import 'package:movies/domain/datasources/actors_datasource.dart';
import 'package:movies/domain/entities/actor.dart';
import 'package:movies/domain/repository/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;

  ActorRepositoryImpl({required this.datasource});

  @override
  Future<List<Actor>> getActorsByMovie(String movideId) {
    return datasource.getActorsByMovie(movideId);
  }
}
