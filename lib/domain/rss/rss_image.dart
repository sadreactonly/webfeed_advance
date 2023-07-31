import 'package:webfeed_advanced/util/iterable.dart';
import 'package:xml/xml.dart';

/// Represents the image information within an RSS feed.
class RssImage {
  final String? title;
  final String? url;
  final String? link;

  /// Constructor for the `RssImage` class.
  ///
  /// Initialize the RSS image properties [title], [url], and [link].
  RssImage({this.title, this.url, this.link});

  /// Factory method to create an `RssImage` object from an [XmlElement].
  ///
  /// This method parses the [element] and extracts the image information from it
  /// to create an `RssImage` object and returns it.
  ///
  /// The [title], [url], and [link] values are obtained by looking for specific elements ('title', 'url', and 'link')
  /// within the [element], and then extracting their inner text.
  ///
  /// The extracted inner text of each element is assigned to the corresponding property of the `RssImage` object.
  factory RssImage.parse(XmlElement element) {
    return RssImage(
      title: element.findElements('title').firstOrNull?.innerText,
      url: element.findElements('url').firstOrNull?.innerText,
      link: element.findElements('link').firstOrNull?.innerText,
    );
  }
}
