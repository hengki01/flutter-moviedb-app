List<String> matchingGenre(genreIDs, listGenres) {
  List<String> genreItems = [];

  for(var genreID in genreIDs) {
    for(var genre in listGenres) {
      if(genreID == genre.id) {
        genreItems.add(genre.name);
      }
    }
  }

  return genreItems;
}
