import 'package:xml/xml.dart';

/// Represents a parameter with a name and a value.
class Param {
  /// The name of the parameter.
  final String? name;

  /// The value of the parameter.
  final String? value;

  /// Constructor for creating a [Param] object.
  ///
  /// The constructor initializes a [Param] object with optional named parameters:
  /// - [name]: The name of the parameter.
  /// - [value]: The value of the parameter.
  Param({
    this.name,
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create a [Param] object from it.
  ///
  /// The [element] is an XML element containing the parameter information.
  ///
  /// Returns the parsed [Param] object.
  factory Param.parse(XmlElement element) {
    return Param(
      name: element.getAttribute('name'),
      value: element.innerText,
    );
  }
}
