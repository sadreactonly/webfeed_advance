import 'package:xml/xml.dart';

/// Represents the "license" element in an XML document.
class License {
  final String? type; // Type attribute value of the license.
  final String? href; // Href attribute value of the license.
  final String? value; // Value of the license.
  final String? url; // Url attribute value of the license.

  /// Constructor for the License class.
  ///
  /// The constructor initializes a License object with optional named parameters:
  /// - `type`: Type attribute value of the license.
  /// - `href`: Href attribute value of the license.
  /// - `value`: Value of the license.
  /// - `url`: Url attribute value of the license.
  License({
    this.type,
    this.href,
    this.value,
    this.url,
  });

  /// Factory method to create a new License instance from an XML element.
  ///
  /// The factory constructor takes an [XmlElement] representing the "license" element
  /// and extracts its attributes "type", "href", and "url", as well as the inner text.
  /// It uses these values to initialize the properties of the License object.
  factory License.parse(XmlElement element) {
    return License(
      type: element
          .getAttribute('type'), // Get the value of the "type" attribute.
      href: element
          .getAttribute('href'), // Get the value of the "href" attribute.
      url: element.getAttribute('url'), // Get the value of the "url" attribute.
      value: element.innerText, // Get the inner text of the "license" element.
    );
  }
}
