import 'package:xml/xml.dart';

/// Represents a rating with scheme and value attributes.
class Rating {
  /// The scheme attribute value of the rating.
  final String? scheme;

  /// The value of the rating.
  final String? value;

  /// Constructor for creating a [Rating] object.
  ///
  /// The constructor initializes a [Rating] object with optional named parameters:
  /// - [scheme]: The scheme attribute value of the rating.
  /// - [value]: The value of the rating.
  Rating({
    this.scheme,
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create a [Rating] object from it.
  ///
  /// The [element] is an XML element containing the rating information.
  ///
  /// Returns the parsed [Rating] object.
  factory Rating.parse(XmlElement element) {
    return Rating(
      scheme: element.getAttribute('scheme'),
      value: element.innerText,
    );
  }
}
