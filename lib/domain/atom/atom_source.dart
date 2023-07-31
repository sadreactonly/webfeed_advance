import 'package:webfeed_advance/util/iterable.dart';
import 'package:xml/xml.dart';

/// Represents the source of an Atom entry.
///
/// The `AtomSource` class corresponds to the "source" element in the Atom feed.
class AtomSource {
  /// The ID of the source.
  final String? id;

  /// The title of the source.
  final String? title;

  /// The updated date and time of the source.
  final String? updated;

  /// Constructor for creating an [AtomSource] object.
  ///
  /// The constructor initializes an [AtomSource] object with the following named parameters:
  /// - [id]: The ID of the source.
  /// - [title]: The title of the source.
  /// - [updated]: The updated date and time of the source.
  AtomSource({
    this.id,
    this.title,
    this.updated,
  });

  /// Factory method to parse an [XmlElement] and create an [AtomSource] object from it.
  ///
  /// The [element] is an XML element containing the source information.
  ///
  /// Returns the parsed [AtomSource] object.
  factory AtomSource.parse(XmlElement element) {
    return AtomSource(
      id: element.findElements('id').firstOrNull?.innerText,
      title: element.findElements('title').firstOrNull?.innerText,
      updated: element.findElements('updated').firstOrNull?.innerText,
    );
  }
}
