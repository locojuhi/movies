import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String theMovieDBAccessKey =
      dotenv.env['THE_MOVIEDB_ACESS_KEY'] ?? 'THE_MOVIEDB_ACESS_KEY';

  static String theMovieDBBaseURL =
      dotenv.env['THE_MOVIEDB_BASE_URL'] ?? 'THE_MOVIEDB_BASE_URL';

  static String theMovieDBAPIVersion =
      dotenv.env['THE_MOVIEDB_API_VERSION'] ?? 'THE_MOVIEDB_API_VERSION';
}
