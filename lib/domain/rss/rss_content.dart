import 'package:xml/xml.dart';

// Regular expression to find image URLs in the content.
final _imagesRegExp = RegExp(
  "<img\\s.*?src=(?:'|\")([^'\">]+)(?:'|\")",
  multiLine: true,
  caseSensitive: false,
);

/// Represents the content element in an RSS feed.
///
/// This class is used to parse the content of an RSS feed item and extract any image URLs present in it.
///
/// For RSS Content Module:
///
/// - `xmlns:content="http://purl.org/rss/1.0/modules/content/"`
///
class RssContent {
  String value; // The full content of the RSS item.
  Iterable<String> images; // List of image URLs found in the content.

  /// Constructor for the `RssContent` class.
  ///
  /// Initialize the RSS content [value] and [images].
  RssContent(this.value, this.images);

  /// Factory method to create an `RssContent` object from an [XmlElement].
  ///
  /// This method parses the [element] and extracts the inner text (content) from it.
  /// It also uses the `_imagesRegExp` regular expression to find image URLs in the content
  /// and stores them in the [images] property as an iterable of strings.
  ///
  /// The extracted content is assigned to the [value] property, and the found image URLs are stored in [images].
  factory RssContent.parse(XmlElement element) {
    final dynamic content = element.innerText;
    final images = <String>[];
    _imagesRegExp.allMatches(content).forEach((match) {
      images.add(match.group(1)!);
    });
    return RssContent(content, images);
  }
}
