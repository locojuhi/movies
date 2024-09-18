import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/repository/local_storage_repository.dart';
import 'package:movies/presentation/providers/storage/local_storage_provider.dart';

final favoriteMoviesProvider =
    StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({required this.localStorageRepository}) : super({});

  Future<List<Movie>> loadNexPage() async {
    final movies = await localStorageRepository.loadMovies(offset: page * 10);
    page++;

    final tempMoviesMap = <int, Movie>{};

    for (var movie in movies) {
      tempMoviesMap[movie.id] = movie;
    }

    state = {...state, ...tempMoviesMap};
    return movies;
  }
}
