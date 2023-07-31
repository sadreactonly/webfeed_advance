import 'package:xml/xml.dart';

/// Represents the "credit" element in an XML document.
class Credit {
  final String? role; // The role attribute of the credit.
  final String? scheme; // The scheme attribute of the credit.
  final String? value; // The value of the credit.

  /// Constructor for the Credit class.
  ///
  /// The constructor initializes a Credit object with optional named parameters:
  /// - `role`: The role attribute of the credit.
  /// - `scheme`: The scheme attribute of the credit.
  /// - `value`: The value of the credit.
  ///
  /// All parameters are optional and can be set to null if not provided.
  Credit({
    this.role,
    this.scheme,
    this.value,
  });

  /// Factory method to create a new Credit instance from an XML element.
  ///
  /// The factory constructor takes an [XmlElement] representing the "credit" element
  /// and extracts its attributes 'role' and 'scheme', as well as its inner text value.
  /// It uses these values to initialize the properties of the Credit object.
  factory Credit.parse(XmlElement element) {
    return Credit(
      role: element.getAttribute('role'), // Extract the 'role' attribute.
      scheme: element.getAttribute('scheme'), // Extract the 'scheme' attribute.
      value: element
          .innerText, // Extract the inner text of the element as 'value'.
    );
  }
}
