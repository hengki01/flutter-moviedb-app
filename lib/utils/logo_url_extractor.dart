List<String> logoUrlsExtractor(productionCompanies) {
  List<String> logoUrls = [];

  for(var productionCompany in productionCompanies) {
    if(productionCompany["logo_path"] != null) {
      logoUrls.add(productionCompany["logo_path"]);
    }
  }

  return logoUrls;
}