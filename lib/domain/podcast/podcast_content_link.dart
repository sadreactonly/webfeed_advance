import 'package:xml/xml.dart';

/// Represents a content link in a podcast episode or item.
///
/// The `ContentLink` class corresponds to the `podcast:contentLink` element in the podcast namespace.
class ContentLink {
  /// The URL of the content link.
  final String? href;

  /// The value of the content link.
  final String? value;

  /// Constructor for creating a [ContentLink] object.
  ///
  /// The constructor initializes a [ContentLink] object with optional named parameters:
  /// - [href]: The URL of the content link.
  /// - [value]: The value of the content link.
  ContentLink({
    this.href,
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create a [ContentLink] object from it.
  ///
  /// The [element] is an XML element containing the content link information.
  ///
  /// Returns the parsed [ContentLink] object.
  factory ContentLink.parse(XmlElement element) {
    return ContentLink(
      href: element.getAttribute('href'),
      value: element.innerText,
    );
  }
}
