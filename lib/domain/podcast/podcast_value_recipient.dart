import 'package:xml/xml.dart';

/// Represents a value recipient with name, customKey, customValue, type, address, split, and fee attributes.
///
/// The `ValueRecipient` class corresponds to the `valueRecipient` element in the podcast namespace.
class ValueRecipient {
  /// The name attribute value of the value recipient.
  final String? name;

  /// The customKey attribute value of the value recipient.
  final String? customKey;

  /// The customValue attribute value of the value recipient.
  final String? customValue;

  /// The type attribute value of the value recipient.
  final String? type;

  /// The address attribute value of the value recipient.
  final String? address;

  /// The split attribute value of the value recipient.
  final int? split;

  /// The fee attribute value of the value recipient.
  final bool fee;

  /// Constructor for creating a [ValueRecipient] object.
  ///
  /// The constructor initializes a [ValueRecipient] object with optional named parameters:
  /// - [name]: The name attribute value of the value recipient.
  /// - [customKey]: The customKey attribute value of the value recipient.
  /// - [customValue]: The customValue attribute value of the value recipient.
  /// - [type]: The type attribute value of the value recipient.
  /// - [address]: The address attribute value of the value recipient.
  /// - [split]: The split attribute value of the value recipient.
  /// - [fee]: The fee attribute value of the value recipient.
  ValueRecipient({
    this.name,
    this.customKey,
    this.customValue,
    this.type,
    this.address,
    this.split,
    required this.fee,
  });

  /// Factory method to parse an [XmlElement] and create a [ValueRecipient] object from it.
  ///
  /// The [element] is an XML element containing the value recipient information.
  ///
  /// Returns the parsed [ValueRecipient] object.
  factory ValueRecipient.parse(XmlElement element) {
    final splitStr = element.getAttribute('split');
    final feeStr = element.getAttribute('fee');
    return ValueRecipient(
      name: element.getAttribute('name'),
      customKey: element.getAttribute('customKey'),
      customValue: element.getAttribute('customValue'),
      type: element.getAttribute('type'),
      address: element.getAttribute('address'),
      split: splitStr == null ? null : int.tryParse(splitStr),
      fee: feeStr?.toLowerCase() == 'true',
    );
  }
}
