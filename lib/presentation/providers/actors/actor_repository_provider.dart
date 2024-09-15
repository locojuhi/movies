import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:movies/infrastructure/repositories/actor_repository_impl.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(datasource: ActorMoviedbDatasource());
});
