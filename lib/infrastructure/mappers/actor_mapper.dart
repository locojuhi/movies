import 'package:movies/domain/entities/actor.dart';
import 'package:movies/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor casToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://ih1.redbubble.net/image.4905811390.8675/ur,mouse_pad_small_flatlay,square,600x600.jpg',
      character: cast.character);
}
