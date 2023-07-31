import 'package:xml/xml.dart';

/// Represents text with type, lang, start, end, and value attributes.
class Text {
  /// The type attribute value of the text.
  final String? type;

  /// The lang attribute value of the text.
  final String? lang;

  /// The start attribute value of the text.
  final String? start;

  /// The end attribute value of the text.
  final String? end;

  /// The value of the text.
  final String? value;

  /// Constructor for creating a [Text] object.
  ///
  /// The constructor initializes a [Text] object with optional named parameters:
  /// - [type]: The type attribute value of the text.
  /// - [lang]: The lang attribute value of the text.
  /// - [start]: The start attribute value of the text.
  /// - [end]: The end attribute value of the text.
  /// - [value]: The value of the text.
  Text({
    this.type,
    this.lang,
    this.start,
    this.end,
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create a [Text] object from it.
  ///
  /// The [element] is an XML element containing the text information.
  ///
  /// Returns the parsed [Text] object.
  factory Text.parse(XmlElement element) {
    return Text(
      type: element.getAttribute('type'),
      lang: element.getAttribute('lang'),
      start: element.getAttribute('start'),
      end: element.getAttribute('end'),
      value: element.innerText,
    );
  }
}
