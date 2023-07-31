import 'package:xml/xml.dart';

/// Represents the "hash" element in an XML document.
class Hash {
  final String? algo; // Algorithm attribute value of the hash.
  final String? value; // Value of the hash.

  /// Constructor for the Hash class.
  ///
  /// The constructor initializes a Hash object with optional named parameters:
  /// - `algo`: Algorithm attribute value of the hash.
  /// - `value`: Value of the hash.
  Hash({
    this.algo,
    this.value,
  });

  /// Factory method to create a new Hash instance from an XML element.
  ///
  /// The factory constructor takes an [XmlElement] representing the "hash" element
  /// and extracts its attributes "algo" and value.
  /// It uses these values to initialize the properties of the Hash object.
  factory Hash.parse(XmlElement element) {
    return Hash(
      algo: element
          .getAttribute('algo'), // Get the value of the "algo" attribute.
      value: element.innerText, // Get the inner text of the "hash" element.
    );
  }
}
