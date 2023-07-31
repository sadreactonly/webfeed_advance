import 'package:xml/xml.dart';

/// Represents a locked status with owner and value attributes.
///
/// The `Locked` class corresponds to the `locked` element in the podcast namespace.
class Locked {
  /// The owner attribute value of the locked status.
  final String? owner;

  /// The value of the locked status represented as a boolean.
  final bool? value;

  /// Constructor for creating a [Locked] object.
  ///
  /// The constructor initializes a [Locked] object with optional named parameters:
  /// - [owner]: The owner attribute value of the locked status.
  /// - [value]: The value of the locked status represented as a boolean.
  Locked({
    this.owner,
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create a [Locked] object from it.
  ///
  /// The [element] is an XML element containing the locked status information.
  ///
  /// Returns the parsed [Locked] object.
  factory Locked.parse(XmlElement element) {
    bool? valueBool;
    switch (element.innerText.toLowerCase()) {
      case 'yes':
        valueBool = true;
        break;
      case 'no':
        valueBool = false;
        break;
      default:
        valueBool = null;
        break;
    }
    return Locked(
      owner: element.getAttribute('owner'),
      value: valueBool,
    );
  }
}
