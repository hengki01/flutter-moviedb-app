class FilterState {
  String filter;

  FilterState({
    this.filter,
  });

  factory FilterState.initial() => FilterState(
    filter: null,
  );
}