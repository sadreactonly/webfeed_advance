import 'package:xml/xml.dart';

/// Represents the iTunes image information.
class ItunesImage {
  final String? href;

  /// Constructor for the `ItunesImage` class.
  ///
  /// Initialize the iTunes image [href].
  ItunesImage({this.href});

  /// Factory method to create an `ItunesImage` object from an [XmlElement].
  ///
  /// This method parses the [element] and extracts the 'href' attribute from it,
  /// which contains the URL of the iTunes image.
  ///
  /// The extracted 'href' value is assigned to the [href] property of the `ItunesImage` object and returned.
  /// The 'href' value is also trimmed before assigning it to remove leading/trailing spaces.
  factory ItunesImage.parse(XmlElement element) {
    return ItunesImage(
      href: element.getAttribute('href')?.trim(),
    );
  }
}
