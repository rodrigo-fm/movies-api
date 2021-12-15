enum Routes {
  popularMovies,
  searchResult,
  movieDetails,
}

extension RoutesExtension on Routes {
  String get route {
    switch (this) {
      case Routes.popularMovies:
        return '/movies/popular';
      case Routes.searchResult:
        return '/movies/search';
      case Routes.movieDetails:
        return '/movies/details';
    }
  }
}
