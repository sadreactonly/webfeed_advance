import 'package:xml/xml.dart';

/// Represents chapters in a podcast episode or item.
///
/// The `Chapters` class corresponds to the `podcast:chapters` element in the podcast namespace.
class Chapters {
  /// The URL of the chapters file.
  final String? url;

  /// The type of chapters.
  final String? type;

  /// Constructor for creating a [Chapters] object.
  ///
  /// The constructor initializes a [Chapters] object with optional named parameters:
  /// - [url]: The URL of the chapters file.
  /// - [type]: The type of chapters.
  Chapters({
    this.url,
    this.type,
  });

  /// Factory method to parse an [XmlElement] and create a [Chapters] object from it.
  ///
  /// The [element] is an XML element containing the chapters information.
  ///
  /// Returns the parsed [Chapters] object.
  factory Chapters.parse(XmlElement element) {
    return Chapters(
      url: element.getAttribute('url'),
      type: element.getAttribute('type'),
    );
  }
}
