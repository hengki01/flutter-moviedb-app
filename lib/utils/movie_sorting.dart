List<dynamic> movieSorting(movieList, sortBy) {
  switch (sortBy) {
    case 'popularity-asc':
      return movieList.sort((a, b) => a.popularity.compareTo(b.popularity));
    case 'popularity-desc':
      return movieList.sort((a, b) => b.popularity.compareTo(a.popularity));
    case 'votecount-asc':
      return movieList;
    case 'votecount-desc':
      return movieList;
    case 'releasedate-asc':
      return movieList;
    case 'releasedate-desc':
      return movieList;
    default :
      return movieList;
  }
}