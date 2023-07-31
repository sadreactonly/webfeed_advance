import 'package:xml/xml.dart';

/// Represents tags with tags and weight attributes.
class Tags {
  /// The tags of the element.
  final String? tags;

  /// The weight attribute value of the tags.
  final int? weight;

  /// Constructor for creating a [Tags] object.
  ///
  /// The constructor initializes a [Tags] object with optional named parameters:
  /// - [tags]: The tags of the element.
  /// - [weight]: The weight attribute value of the tags.
  Tags({
    this.tags,
    this.weight,
  });

  /// Factory method to parse an [XmlElement] and create a [Tags] object from it.
  ///
  /// The [element] is an XML element containing the tags information.
  ///
  /// Returns the parsed [Tags] object.
  factory Tags.parse(XmlElement element) {
    return Tags(
      tags: element.innerText,
      weight: int.tryParse(element.getAttribute('weight') ?? '1'),
    );
  }
}
