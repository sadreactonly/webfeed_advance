import 'package:xml/xml.dart';

/// Represents a link in the Atom feed.
///
/// The `AtomLink` class corresponds to the "link" element in the Atom feed.
class AtomLink {
  /// The URI of the linked resource.
  final String? href;

  /// The relationship between the entry and the linked resource.
  final String? rel;

  /// The media type of the linked resource.
  final String? type;

  /// The language of the linked resource.
  final String? hreflang;

  /// The title of the linked resource.
  final String? title;

  /// The length of the linked resource in bytes.
  final int length;

  /// Constructor for creating an [AtomLink] object.
  ///
  /// The constructor initializes an [AtomLink] object with the following parameters:
  /// - [href]: The URI of the linked resource.
  /// - [rel]: The relationship between the entry and the linked resource.
  /// - [type]: The media type of the linked resource.
  /// - [hreflang]: The language of the linked resource.
  /// - [title]: The title of the linked resource.
  /// - [length]: The length of the linked resource in bytes.
  AtomLink(
    this.href,
    this.rel,
    this.type,
    this.hreflang,
    this.title,
    this.length,
  );

  /// Factory method to parse an [XmlElement] and create an [AtomLink] object from it.
  ///
  /// The [element] is an XML element containing the link information.
  ///
  /// Returns the parsed [AtomLink] object.
  factory AtomLink.parse(XmlElement element) {
    var href = element.getAttribute('href');
    var rel = element.getAttribute('rel');
    var type = element.getAttribute('type');
    var title = element.getAttribute('title');
    var hreflang = element.getAttribute('hreflang');
    var length = 0;
    if (element.getAttribute('length') != null) {
      length = int.parse(element.getAttribute('length')!);
    }
    return AtomLink(href, rel, type, hreflang, title, length);
  }
}
