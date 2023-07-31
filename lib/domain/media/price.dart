import 'package:xml/xml.dart';

/// Represents a price with price, type, info, and currency attributes.
class Price {
  /// The price attribute value of the price.
  final double? price;

  /// The type attribute value of the price.
  final String? type;

  /// The info attribute value of the price.
  final String? info;

  /// The currency attribute value of the price.
  final String? currency;

  /// Constructor for creating a [Price] object.
  ///
  /// The constructor initializes a [Price] object with optional named parameters:
  /// - [price]: The price attribute value of the price.
  /// - [type]: The type attribute value of the price.
  /// - [info]: The info attribute value of the price.
  /// - [currency]: The currency attribute value of the price.
  Price({
    this.price,
    this.type,
    this.info,
    this.currency,
  });

  /// Factory method to parse an [XmlElement] and create a [Price] object from it.
  ///
  /// The [element] is an XML element containing the price information.
  ///
  /// Returns the parsed [Price] object.
  factory Price.parse(XmlElement element) {
    return Price(
      price: double.tryParse(element.getAttribute('price') ?? '0'),
      type: element.getAttribute('type'),
      info: element.getAttribute('info'),
      currency: element.getAttribute('currency'),
    );
  }
}
