import 'package:xml/xml.dart';

/// Represents a generator in an Atom feed.
///
/// The `AtomGenerator` class corresponds to the "generator" element in the Atom feed.
class AtomGenerator {
  /// The URI of the generator.
  final String? uri;

  /// The version of the generator.
  final String? version;

  /// The value of the generator.
  final String? value;

  /// Constructor for creating an [AtomGenerator] object.
  ///
  /// The constructor initializes an [AtomGenerator] object with the following parameters:
  /// - [uri]: The URI of the generator.
  /// - [version]: The version of the generator.
  /// - [value]: The value of the generator.
  AtomGenerator(this.uri, this.version, this.value);

  /// Factory method to parse an [XmlElement] and create an [AtomGenerator] object from it.
  ///
  /// The [element] is an XML element containing the generator information.
  ///
  /// Returns the parsed [AtomGenerator] object.
  factory AtomGenerator.parse(XmlElement element) {
    var uri = element.getAttribute('uri');
    var version = element.getAttribute('version');
    var value = element.innerText;
    return AtomGenerator(uri, version, value);
  }
}
