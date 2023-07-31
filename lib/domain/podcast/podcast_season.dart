import 'package:xml/xml.dart';

/// Represents a season with name and value attributes.
///
/// The `Season` class corresponds to the `season` element in the podcast namespace.
class Season {
  /// The name attribute value of the season.
  final String? name;

  /// The value of the season.
  final int? value;

  /// Constructor for creating a [Season] object.
  ///
  /// The constructor initializes a [Season] object with optional named parameters:
  /// - [name]: The name attribute value of the season.
  /// - [value]: The value of the season.
  Season({
    this.name,
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create a [Season] object from it.
  ///
  /// The [element] is an XML element containing the season information.
  ///
  /// Returns the parsed [Season] object.
  factory Season.parse(XmlElement element) {
    return Season(
      name: element.getAttribute('name'),
      value: int.tryParse(element.innerText),
    );
  }
}
