import 'package:webfeed_advance/domain/media/param.dart';
import 'package:xml/xml.dart';

/// Represents the "embed" element in an XML document.
class Embed {
  final String? url; // The URL attribute of the embed.
  final int? width; // The width attribute of the embed.
  final int? height; // The height attribute of the embed.
  final List<Param>?
      params; // List of Param objects representing media parameters.

  /// Constructor for the Embed class.
  ///
  /// The constructor initializes an Embed object with optional named parameters:
  /// - `url`: The URL attribute of the embed.
  /// - `width`: The width attribute of the embed.
  /// - `height`: The height attribute of the embed.
  /// - `params`: List of Param objects representing media parameters.
  ///
  /// The `width` and `height` parameters are optional and will default to 0 if not provided.
  /// The `params` parameter is also optional and can be set to null if not provided.
  Embed({
    this.url,
    this.width,
    this.height,
    this.params,
  });

  /// Factory method to create a new Embed instance from an XML element.
  ///
  /// The factory constructor takes an [XmlElement] representing the "embed" element
  /// and extracts its attributes 'url', 'width', and 'height', as well as any child "media:param" elements.
  /// It uses these values to initialize the properties of the Embed object.
  factory Embed.parse(XmlElement element) {
    return Embed(
      url: element.getAttribute('url'), // Extract the 'url' attribute.
      width: int.tryParse(element.getAttribute('width') ??
          '0'), // Extract the 'width' attribute.
      height: int.tryParse(element.getAttribute('height') ??
          '0'), // Extract the 'height' attribute.
      params: element
          .findElements('media:param') // Find all child "media:param" elements.
          .map((e) =>
              Param.parse(e)) // Convert each child element to a Param object.
          .toList(), // Convert the iterable to a list.
    );
  }
}
