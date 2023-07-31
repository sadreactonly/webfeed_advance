import 'package:xml/xml.dart';

/// Represents a trailer with url, pubdate, length, type, season, and value attributes.
///
/// The `Trailer` class corresponds to the `trailer` element in the podcast namespace.
class Trailer {
  /// The URL attribute value of the trailer.
  final String? url;

  /// The pubdate attribute value of the trailer.
  final String? pubdate;

  /// The length attribute value of the trailer.
  final int? length;

  /// The type attribute value of the trailer.
  final String? type;

  /// The season attribute value of the trailer.
  final int? season;

  /// The value of the trailer.
  final String? value;

  /// Constructor for creating a [Trailer] object.
  ///
  /// The constructor initializes a [Trailer] object with optional named parameters:
  /// - [url]: The URL attribute value of the trailer.
  /// - [pubdate]: The pubdate attribute value of the trailer.
  /// - [length]: The length attribute value of the trailer.
  /// - [type]: The type attribute value of the trailer.
  /// - [season]: The season attribute value of the trailer.
  /// - [value]: The value of the trailer.
  Trailer({
    this.url,
    this.pubdate,
    this.length,
    this.type,
    this.season,
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create a [Trailer] object from it.
  ///
  /// The [element] is an XML element containing the trailer information.
  ///
  /// Returns the parsed [Trailer] object.
  factory Trailer.parse(XmlElement element) {
    final lengthStr = element.getAttribute('length');
    final seasonStr = element.getAttribute('season');
    return Trailer(
      url: element.getAttribute('url'),
      pubdate: element.getAttribute('pubdate'),
      length: lengthStr == null ? null : int.tryParse(lengthStr),
      type: element.getAttribute('type'),
      season: seasonStr == null ? null : int.tryParse(seasonStr),
      value: element.innerText,
    );
  }
}
