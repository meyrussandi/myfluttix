part of 'services.dart';

class MovieServices {
  static Future<List<MovieModel>> getMovies(int page,
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page";

    client ??= http.Client();

    var response = await client.get(Uri.parse(url));
    if (response.statusCode != 200) {
      return [];
    }

    var data = json.decode(response.body);
    List result = data['results'];

    print("data movie" + result.toString());

    return result.map((e) => MovieModel.fromJson(e)).toList();
  }

  static Future<MovieDetailModel> getMovieDetail(MovieModel movieModel,
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/${movieModel.id}?api_key=$apiKey&language=en-US";

    client ??= http.Client();

    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);

    List genres = (data as Map<String, dynamic>)["genres"];
    String language =
        (data as Map<String, dynamic>)["original_language"].toString();

    switch ((data as Map<String, dynamic>)["original_language"].toString()) {
      case "ja":
        language = "Japanese";
        break;
      case "id":
        language = "Indonesia";
        break;
      case "ko":
        language = "Korean";
        break;
      case "en":
        language = "English";
        break;
    }

    return MovieDetailModel(movieModel,
        language: language,
        genres: genres
            .map((e) => (e as Map<String, dynamic>)["name"].toString())
            .toList());
  }

  static Future<List<CreditModel>> getCredits(int movieID,
      {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/movie/$movieID/credits?api_key=$apiKey";

    client ??= http.Client();

    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);

    return ((data as Map<String, dynamic>)['cast'] as List)
        .map((e) => CreditModel(
            name: (e as Map<String, dynamic>)["name"],
            profilePath: (e as Map<String, dynamic>)["profile_path"]))
        .take(8)
        .toList();
  }
}
