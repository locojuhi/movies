import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDBAccessKey =
      dotenv.env['THE_MOVIEDB_ACESS_KEY'] ?? 'THE_MOVIEDB_ACESS_KEY';
}
