import 'package:xml/xml.dart';

/// Represents rights with a status attribute.
class Rights {
  /// The status attribute value of the rights.
  final String? status;

  /// Constructor for creating a [Rights] object.
  ///
  /// The constructor initializes a [Rights] object with an optional named parameter:
  /// - [status]: The status attribute value of the rights.
  Rights({
    this.status,
  });

  /// Factory method to parse an [XmlElement] and create a [Rights] object from it.
  ///
  /// The [element] is an XML element containing the rights information.
  ///
  /// Returns the parsed [Rights] object.
  factory Rights.parse(XmlElement element) {
    return Rights(
      status: element.getAttribute('status'),
    );
  }
}
