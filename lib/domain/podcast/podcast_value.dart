import 'package:webfeed_advance/domain/podcast/podcast_value_recipient.dart';
import 'package:xml/xml.dart';

/// Represents a value with type, method, suggested, and valueRecipients attributes.
///
/// The `Value` class corresponds to the `value` element in the podcast namespace.
class Value {
  /// The type attribute value of the value.
  final String? type;

  /// The method attribute value of the value.
  final String? method;

  /// The suggested attribute value of the value.
  final String? suggested;

  /// The list of value recipients associated with this value.
  final List<ValueRecipient> valueRecipients;

  /// Constructor for creating a [Value] object.
  ///
  /// The constructor initializes a [Value] object with optional named parameters:
  /// - [type]: The type attribute value of the value.
  /// - [method]: The method attribute value of the value.
  /// - [suggested]: The suggested attribute value of the value.
  /// - [valueRecipients]: The list of value recipients associated with this value.
  Value({
    this.type,
    this.method,
    this.suggested,
    required this.valueRecipients,
  });

  /// Factory method to parse an [XmlElement] and create a [Value] object from it.
  ///
  /// The [element] is an XML element containing the value information.
  ///
  /// Returns the parsed [Value] object.
  factory Value.parse(XmlElement element) {
    return Value(
      type: element.getAttribute('type'),
      method: element.getAttribute('method'),
      suggested: element.getAttribute('suggested'),
      valueRecipients: element
          .findElements('podcast:valueRecipient')
          .map((e) => ValueRecipient.parse(e))
          .toList(),
    );
  }
}
