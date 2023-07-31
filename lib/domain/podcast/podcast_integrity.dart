import 'package:xml/xml.dart';

/// Represents the integrity attribute associated with a podcast item.
///
/// The `Integrity` class corresponds to the `podcast:integrity` element in the podcast namespace.
class Integrity {
  /// The type attribute value of the integrity.
  final String? type;

  /// The value of the integrity.
  final String? value;

  /// Constructor for creating an [Integrity] object.
  ///
  /// The constructor initializes an [Integrity] object with optional named parameters:
  /// - [type]: The type attribute value of the integrity.
  /// - [value]: The value of the integrity.
  Integrity({
    this.type,
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create an [Integrity] object from it.
  ///
  /// The [element] is an XML element containing the integrity information.
  ///
  /// Returns the parsed [Integrity] object.
  factory Integrity.parse(XmlElement element) {
    return Integrity(
      type: element.getAttribute('type'),
      value: element.getAttribute('value'),
    );
  }
}
