import 'package:xml/xml.dart';

/// Represents a source with uri and contentType attributes.
///
/// The `Source` class corresponds to the `source` element in the podcast namespace.
class Source {
  /// The URI attribute value of the source.
  final String? uri;

  /// The contentType attribute value of the source.
  final String? contentType;

  /// Constructor for creating a [Source] object.
  ///
  /// The constructor initializes a [Source] object with optional named parameters:
  /// - [uri]: The URI attribute value of the source.
  /// - [contentType]: The contentType attribute value of the source.
  Source({
    this.uri,
    this.contentType,
  });

  /// Factory method to parse an [XmlElement] and create a [Source] object from it.
  ///
  /// The [element] is an XML element containing the source information.
  ///
  /// Returns the parsed [Source] object.
  factory Source.parse(XmlElement element) {
    return Source(
      uri: element.getAttribute('uri'),
      contentType: element.getAttribute('contentType'),
    );
  }
}
