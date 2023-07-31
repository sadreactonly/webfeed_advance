import 'package:xml/xml.dart';

/// Represents the "description" element in an XML document.
class Description {
  final String? type; // The type attribute of the description.
  final String? value; // The value of the description.

  /// Constructor for the Description class.
  ///
  /// The constructor initializes a Description object with optional named parameters:
  /// - `type`: The type attribute of the description.
  /// - `value`: The value of the description.
  ///
  /// Both parameters are optional and can be set to null if not provided.
  Description({
    this.type,
    this.value,
  });

  /// Factory method to create a new Description instance from an XML element.
  ///
  /// The factory constructor takes an [XmlElement] representing the "description" element
  /// and extracts its attribute 'type', as well as its inner text value.
  /// It uses these values to initialize the properties of the Description object.
  factory Description.parse(XmlElement element) {
    return Description(
      type: element.getAttribute('type'), // Extract the 'type' attribute.
      value: element
          .innerText, // Extract the inner text of the element as 'value'.
    );
  }
}
