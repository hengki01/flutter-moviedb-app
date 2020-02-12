class Filter {
  final String filter;

  Filter({
    this.filter,
  });

  factory Filter.fromDropdown(String payload) => Filter(
    filter: payload,
  );
}