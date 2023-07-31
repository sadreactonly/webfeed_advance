import 'package:xml/xml.dart';

/// Represents an episode identifier for a podcast episode.
///
/// The `Episode` class corresponds to the `podcast:episode` element in the podcast namespace.
class Episode {
  /// The display value of the episode identifier.
  final String? display;

  /// The numeric value of the episode identifier.
  final double? value;

  /// Constructor for creating an [Episode] object.
  ///
  /// The constructor initializes an [Episode] object with optional named parameters:
  /// - [display]: The display value of the episode identifier.
  /// - [value]: The numeric value of the episode identifier.
  Episode({
    this.display,
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create an [Episode] object from it.
  ///
  /// The [element] is an XML element containing the episode identifier information.
  ///
  /// Returns the parsed [Episode] object.
  factory Episode.parse(XmlElement element) {
    return Episode(
      display: element.getAttribute('display'),
      value: double.tryParse(element.innerText),
    );
  }
}
