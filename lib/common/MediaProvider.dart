import 'package:movieapp_180247/model/Media.dart';
import 'package:movieapp_180247/common/HttpHandler.dart';
import 'package:movieapp_180247/model/Cast.dart';
import 'dart:async';

abstract class MediaProvider {
  Future<List<Media>> fetchMedia(String category);
  Future<List<Cast>> fetchCast(int mediaId);
}

class MediaPrvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String category) {
    return _client.fetchMovies(category: category);
  }

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _client.fetchCreditMovies(mediaId);
  }
}

class ShowProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String category) {
    return _client.fetchShow(category: category);
  }

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _client.fetchCreditShows(mediaId);
  }
}
