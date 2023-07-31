import 'package:xml/xml.dart';

/// Represents a transcript with url, type, language, and rel attributes.
///
/// The `Transcript` class corresponds to the `transcript` element in the podcast namespace.
class Transcript {
  /// The URL attribute value of the transcript.
  final String? url;

  /// The type attribute value of the transcript.
  final String? type;

  /// The language attribute value of the transcript.
  final String? language;

  /// The rel attribute value of the transcript.
  final String? rel;

  /// Constructor for creating a [Transcript] object.
  ///
  /// The constructor initializes a [Transcript] object with optional named parameters:
  /// - [url]: The URL attribute value of the transcript.
  /// - [type]: The type attribute value of the transcript.
  /// - [language]: The language attribute value of the transcript.
  /// - [rel]: The rel attribute value of the transcript.
  Transcript({
    this.url,
    this.type,
    this.language,
    this.rel,
  });

  /// Factory method to parse an [XmlElement] and create a [Transcript] object from it.
  ///
  /// The [element] is an XML element containing the transcript information.
  ///
  /// Returns the parsed [Transcript] object.
  factory Transcript.parse(XmlElement element) {
    return Transcript(
      url: element.getAttribute('url'),
      type: element.getAttribute('type'),
      language: element.getAttribute('language'),
      rel: element.getAttribute('rel'),
    );
  }
}
