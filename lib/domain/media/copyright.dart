import 'package:xml/xml.dart';

/// Represents the "copyright" element in an XML document.
class Copyright {
  final String? url; // The URL associated with the copyright.
  final String? value; // The value of the copyright.

  /// Constructor for the Copyright class.
  ///
  /// The constructor initializes a Copyright object with optional named parameters:
  /// - `url`: The URL associated with the copyright.
  /// - `value`: The value of the copyright.
  ///
  /// Both parameters are optional and can be set to null if not provided.
  Copyright({
    this.url,
    this.value,
  });

  /// Factory method to create a new Copyright instance from an XML element.
  ///
  /// The factory constructor takes an [XmlElement] representing the "copyright" element
  /// and extracts its attributes 'url' and inner text. It uses these values to initialize
  /// the properties of the Copyright object.
  factory Copyright.parse(XmlElement element) {
    return Copyright(
      url: element.getAttribute('url'), // Extract the 'url' attribute.
      value: element
          .innerText, // Extract the inner text of the element as 'value'.
    );
  }
}
