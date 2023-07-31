import 'package:xml/xml.dart';

/// Represents the globally unique identifier (GUID) of a podcast item.
///
/// The `Guid` class corresponds to the `podcast:guid` element in the podcast namespace.
class Guid {
  /// The value of the GUID.
  final String? value;

  /// Constructor for creating a [Guid] object.
  ///
  /// The constructor initializes a [Guid] object with an optional named parameter:
  /// - [value]: The value of the GUID.
  Guid({
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create a [Guid] object from it.
  ///
  /// The [element] is an XML element containing the GUID information.
  ///
  /// Returns the parsed [Guid] object.
  factory Guid.parse(XmlElement element) {
    return Guid(
      value: element.innerText,
    );
  }
}
