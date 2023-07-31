import 'package:xml/xml.dart';

/// Represents the enclosure element in an RSS feed.
class RssEnclosure {
  final String? url;
  final String? type;
  final int? length;

  /// Constructor for the `RssEnclosure` class.
  ///
  /// Initialize the RSS enclosure properties [url], [type], and [length].
  RssEnclosure(this.url, this.type, this.length);

  /// Factory method to create an `RssEnclosure` object from an [XmlElement].
  ///
  /// This method parses the [element] and extracts the URL attribute ('url'), type attribute ('type'),
  /// and length attribute ('length') from it to create an `RssEnclosure` object and returns it.
  ///
  /// The extracted URL value is assigned to the [url] property.
  /// The extracted type value is assigned to the [type] property.
  /// The extracted length value is parsed as an integer and assigned to the [length] property.
  /// If the length attribute is not provided or cannot be parsed as an integer, it defaults to 0.
  factory RssEnclosure.parse(XmlElement element) {
    var url = element.getAttribute('url');
    var type = element.getAttribute('type');
    var length = int.tryParse(element.getAttribute('length') ?? '0');
    return RssEnclosure(url, type, length);
  }
}
