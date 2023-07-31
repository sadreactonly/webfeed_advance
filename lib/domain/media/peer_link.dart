import 'package:xml/xml.dart';

/// Represents a peer link with type, href, and value attributes.
class PeerLink {
  /// The type attribute value of the peer link.
  final String? type;

  /// The href attribute value of the peer link.
  final String? href;

  /// The value of the peer link.
  final String? value;

  /// Constructor for creating a [PeerLink] object.
  ///
  /// The constructor initializes a [PeerLink] object with optional named parameters:
  /// - [type]: The type attribute value of the peer link.
  /// - [href]: The href attribute value of the peer link.
  /// - [value]: The value of the peer link.
  PeerLink({
    this.type,
    this.href,
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create a [PeerLink] object from it.
  ///
  /// The [element] is an XML element containing the peer link information.
  ///
  /// Returns the parsed [PeerLink] object.
  factory PeerLink.parse(XmlElement element) {
    return PeerLink(
      type: element.getAttribute('type'),
      href: element.getAttribute('href'),
      value: element.innerText,
    );
  }
}
