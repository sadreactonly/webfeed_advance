import 'package:xml/xml.dart';

/// Represents a title with type and value attributes.
class Title {
  /// The type attribute value of the title.
  final String? type;

  /// The value of the title.
  final String? value;

  /// Constructor for creating a [Title] object.
  ///
  /// The constructor initializes a [Title] object with optional named parameters:
  /// - [type]: The type attribute value of the title.
  /// - [value]: The value of the title.
  Title({
    this.type,
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create a [Title] object from it.
  ///
  /// The [element] is an XML element containing the title information.
  ///
  /// Returns the parsed [Title] object.
  factory Title.parse(XmlElement element) {
    return Title(
      type: element.getAttribute('type'),
      value: element.innerText,
    );
  }
}
