extension WebFeedIterable<T> on Iterable<T> {
  /// Get the first element of the iterable or return null if the iterable is empty.
  ///
  /// This getter allows you to safely access the first element of the iterable without
  /// triggering an exception if the iterable is empty. If the iterable contains elements,
  /// it will return the first element; otherwise, it will return null.
  T? get firstOrNull => isEmpty ? null : first;
}
