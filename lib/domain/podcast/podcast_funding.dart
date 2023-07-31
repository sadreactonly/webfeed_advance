import 'package:xml/xml.dart';

/// Represents funding information for a podcast episode.
///
/// The `Funding` class corresponds to the `podcast:funding` element in the podcast namespace.
class Funding {
  /// The URL associated with the funding information.
  final String? url;

  /// The value of the funding information.
  final String? value;

  /// Constructor for creating a [Funding] object.
  ///
  /// The constructor initializes a [Funding] object with optional named parameters:
  /// - [url]: The URL associated with the funding information.
  /// - [value]: The value of the funding information.
  Funding({
    this.url,
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create a [Funding] object from it.
  ///
  /// The [element] is an XML element containing the funding information.
  ///
  /// Returns the parsed [Funding] object.
  factory Funding.parse(XmlElement element) {
    return Funding(
      url: element.getAttribute('url'),
      value: element.innerText,
    );
  }
}
