import 'package:xml/xml.dart';

/// Represents the source element in an RSS feed.
class RssSource {
  final String? url;
  final String? value;

  /// Constructor for the `RssSource` class.
  ///
  /// Initialize the RSS source properties [url] and [value].
  RssSource(this.url, this.value);

  /// Factory method to create an `RssSource` object from an [XmlElement].
  ///
  /// This method parses the [element] and extracts the URL attribute ('url') and inner text from it
  /// to create an `RssSource` object and returns it.
  ///
  /// The extracted URL value is assigned to the [url] property.
  /// The extracted inner text is assigned to the [value] property.
  factory RssSource.parse(XmlElement element) {
    var url = element.getAttribute('url');
    var value = element.innerText;

    return RssSource(url, value);
  }
}
