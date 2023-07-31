import 'package:xml/xml.dart';

/// Represents a status with state and reason attributes.
class Status {
  /// The state attribute value of the status.
  final String? state;

  /// The reason attribute value of the status.
  final String? reason;

  /// Constructor for creating a [Status] object.
  ///
  /// The constructor initializes a [Status] object with optional named parameters:
  /// - [state]: The state attribute value of the status.
  /// - [reason]: The reason attribute value of the status.
  Status({
    this.state,
    this.reason,
  });

  /// Factory method to parse an [XmlElement] and create a [Status] object from it.
  ///
  /// The [element] is an XML element containing the status information.
  ///
  /// Returns the parsed [Status] object.
  factory Status.parse(XmlElement element) {
    return Status(
      state: element.getAttribute('state'),
      reason: element.getAttribute('reason'),
    );
  }
}
