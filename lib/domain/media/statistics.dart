import 'package:xml/xml.dart';

/// Represents statistics with views and favorites attributes.
class Statistics {
  /// The views attribute value of the statistics.
  final int? views;

  /// The favorites attribute value of the statistics.
  final int? favorites;

  /// Constructor for creating a [Statistics] object.
  ///
  /// The constructor initializes a [Statistics] object with optional named parameters:
  /// - [views]: The views attribute value of the statistics.
  /// - [favorites]: The favorites attribute value of the statistics.
  Statistics({
    this.views,
    this.favorites,
  });

  /// Factory method to parse an [XmlElement] and create a [Statistics] object from it.
  ///
  /// The [element] is an XML element containing the statistics information.
  ///
  /// Returns the parsed [Statistics] object.
  factory Statistics.parse(XmlElement? element) {
    return Statistics(
      views: int.tryParse(element?.getAttribute('views') ?? '0'),
      favorites: int.tryParse(element?.getAttribute('favorites') ?? '0'),
    );
  }
}
