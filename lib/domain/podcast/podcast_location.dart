import 'package:xml/xml.dart';

/// Represents a location with geo, osm, and value attributes.
///
/// The `Location` class corresponds to the `location` element in the podcast namespace.
class Location {
  /// The geo attribute value of the location.
  final String? geo;

  /// The osm attribute value of the location.
  final String? osm;

  /// The value of the location.
  final String? value;

  /// Constructor for creating a [Location] object.
  ///
  /// The constructor initializes a [Location] object with optional named parameters:
  /// - [geo]: The geo attribute value of the location.
  /// - [osm]: The osm attribute value of the location.
  /// - [value]: The value of the location.
  Location({
    this.geo,
    this.osm,
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create a [Location] object from it.
  ///
  /// The [element] is an XML element containing the location information.
  ///
  /// Returns the parsed [Location] object.
  factory Location.parse(XmlElement element) {
    return Location(
      geo: element.getAttribute('geo'),
      osm: element.getAttribute('osm'),
      value: element.innerText,
    );
  }
}
