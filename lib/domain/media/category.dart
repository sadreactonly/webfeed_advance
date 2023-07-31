import 'package:xml/xml.dart';

/// Represents an XML category element commonly found in RSS feeds.
class Category {
  final String? scheme; // The scheme attribute of the category element.
  final String? label; // The label attribute of the category element.
  final String? value; // The inner text of the category element.

  /// Constructor for the Category class.
  ///
  /// The constructor initializes a Category object with optional named parameters:
  /// - `scheme`: The scheme attribute of the category element.
  /// - `label`: The label attribute of the category element.
  /// - `value`: The inner text of the category element.
  ///
  /// All parameters are optional and can be set to null if not provided.
  Category({
    this.scheme,
    this.label,
    this.value,
  });

  /// Factory method to create a new Category instance from an XML element.
  ///
  /// The factory constructor takes an [XmlElement] representing the category element
  /// and extracts its attributes 'scheme' and 'label', as well as its inner text 'value'.
  /// The extracted values are used to initialize the properties of the Category object.
  factory Category.parse(XmlElement element) {
    return Category(
      scheme: element.getAttribute('scheme'), // Extract 'scheme' attribute.
      label: element.getAttribute('label'), // Extract 'label' attribute.
      value: element.innerText, // Extract inner text.
    );
  }
}
