import 'package:xml/xml.dart';

/// Represents the `<category>` element in an RSS feed.
///
/// The `<category>` element provides information about the category
/// to which the RSS feed item belongs.
class RssCategory {
  final String? domain;
  final String value;

  /// Constructor for the `RssCategory` class.
  ///
  /// Initialize the RSS category properties [domain] and [value].
  RssCategory(this.domain, this.value);

  /// Factory method to create an `RssCategory` object from an [XmlElement].
  ///
  /// This method parses the [element] and extracts the 'domain' attribute and inner text from it
  /// to create an `RssCategory` object and returns it.
  ///
  /// The extracted 'domain' attribute value is assigned to the [domain] property.
  /// The inner text is assigned to the [value] property.
  factory RssCategory.parse(XmlElement element) {
    var domain = element.getAttribute('domain');
    var value = element.innerText;

    return RssCategory(domain, value);
  }
}
