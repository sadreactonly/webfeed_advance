import 'package:xml/xml.dart';

/// Represents a thumbnail with url, width, height, and time attributes.
class Thumbnail {
  /// The URL attribute value of the thumbnail.
  final String? url;

  /// The width attribute value of the thumbnail.
  final String? width;

  /// The height attribute value of the thumbnail.
  final String? height;

  /// The time attribute value of the thumbnail.
  final String? time;

  /// Constructor for creating a [Thumbnail] object.
  ///
  /// The constructor initializes a [Thumbnail] object with optional named parameters:
  /// - [url]: The URL attribute value of the thumbnail.
  /// - [width]: The width attribute value of the thumbnail.
  /// - [height]: The height attribute value of the thumbnail.
  /// - [time]: The time attribute value of the thumbnail.
  Thumbnail({
    this.url,
    this.width,
    this.height,
    this.time,
  });

  /// Factory method to parse an [XmlElement] and create a [Thumbnail] object from it.
  ///
  /// The [element] is an XML element containing the thumbnail information.
  ///
  /// Returns the parsed [Thumbnail] object.
  factory Thumbnail.parse(XmlElement element) {
    return Thumbnail(
      url: element.getAttribute('url'),
      width: element.getAttribute('width'),
      height: element.getAttribute('height'),
      time: element.getAttribute('time'),
    );
  }
}
