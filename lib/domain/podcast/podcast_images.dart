import 'package:xml/xml.dart';

/// Represents the images associated with a podcast item.
///
/// The `Images` class corresponds to the `podcast:images` element in the podcast namespace.
class Images {
  /// A list of [Src] objects representing different image sources with their respective widths.
  final List<Src> srcset;

  /// Constructor for creating an [Images] object.
  ///
  /// The constructor initializes an [Images] object with a required [srcset] parameter, which is a list of [Src] objects.
  Images({
    required this.srcset,
  });

  /// Factory method to parse an [XmlElement] and create an [Images] object from it.
  ///
  /// The [element] is an XML element containing the images information.
  ///
  /// Returns the parsed [Images] object.
  factory Images.parse(XmlElement element) {
    final exp = RegExp(r'(\S+)\s+(\d+)w');
    var srcset = element.getAttribute('srcset');
    if (srcset != null) {
      return Images(
        srcset: srcset
            .split(',')
            .map((e) {
              final matches = exp.allMatches(e).toList();
              if (matches.isNotEmpty) {
                return Src(
                  url: matches[0].group(1).toString(),
                  width: int.tryParse(matches[0].group(2).toString()),
                );
              } else {
                return null;
              }
            })
            .whereType<Src>()
            .toList(),
      );
    } else {
      return Images(srcset: []);
    }
  }
}

/// Represents a source URL with its associated width for an image.
///
/// The `Src` class is used as a part of the `Images` class to represent individual image sources.
class Src {
  /// The URL of the image source.
  final String? url;

  /// The width of the image source in pixels.
  final int? width;

  /// Constructor for creating a [Src] object.
  ///
  /// The constructor initializes a [Src] object with required named parameters:
  /// - [url]: The URL of the image source.
  /// - [width]: The width of the image source in pixels.
  Src({
    required this.url,
    required this.width,
  });
}
