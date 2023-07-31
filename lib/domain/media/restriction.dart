import 'package:xml/xml.dart';

/// Represents a restriction with relationship, type, and value attributes.
class Restriction {
  /// The relationship attribute value of the restriction.
  final String? relationship;

  /// The type attribute value of the restriction.
  final String? type;

  /// The value of the restriction.
  final String? value;

  /// Constructor for creating a [Restriction] object.
  ///
  /// The constructor initializes a [Restriction] object with optional named parameters:
  /// - [relationship]: The relationship attribute value of the restriction.
  /// - [type]: The type attribute value of the restriction.
  /// - [value]: The value of the restriction.
  Restriction({
    this.relationship,
    this.type,
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create a [Restriction] object from it.
  ///
  /// The [element] is an XML element containing the restriction information.
  ///
  /// Returns the parsed [Restriction] object.
  factory Restriction.parse(XmlElement element) {
    return Restriction(
      relationship: element.getAttribute('relationship'),
      type: element.getAttribute('type'),
      value: element.innerText,
    );
  }
}
