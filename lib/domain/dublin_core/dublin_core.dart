import 'package:webfeed_advance/util/datetime.dart';
import 'package:webfeed_advance/util/iterable.dart';
import 'package:xml/xml.dart';

/// Represents the Dublin Core metadata for a feed item.
class DublinCore {
  final String? title;
  final String? description;
  final String? creator;
  final String? subject;
  final String? publisher;
  final String? contributor;
  final DateTime? date;
  final DateTime? created;
  final DateTime? modified;
  final String? type;
  final String? format;
  final String? identifier;
  final String? source;
  final String? language;
  final String? relation;
  final String? coverage;
  final String? rights;

  /// Constructor for the `DublinCore` class.
  ///
  /// Initialize the Dublin Core metadata properties.
  DublinCore({
    this.title,
    this.description,
    this.creator,
    this.subject,
    this.publisher,
    this.contributor,
    this.date,
    this.created,
    this.modified,
    this.type,
    this.format,
    this.identifier,
    this.source,
    this.language,
    this.relation,
    this.coverage,
    this.rights,
  });

  /// Factory method to create a `DublinCore` object from an [XmlElement].
  ///
  /// This method parses the [element] and extracts the Dublin Core metadata values from it
  /// to create a `DublinCore` object and returns it.
  factory DublinCore.parse(XmlElement element) {
    return DublinCore(
      title: element.findElements('dc:title').firstOrNull?.innerText,
      description:
          element.findElements('dc:description').firstOrNull?.innerText,
      creator: element.findElements('dc:creator').firstOrNull?.innerText,
      subject: element.findElements('dc:subject').firstOrNull?.innerText,
      publisher: element.findElements('dc:publisher').firstOrNull?.innerText,
      contributor:
          element.findElements('dc:contributor').firstOrNull?.innerText,
      date:
          parseDateTime(element.findElements('dc:date').firstOrNull?.innerText),
      created: parseDateTime(
          element.findElements('dc:created').firstOrNull?.innerText),
      modified: parseDateTime(
          element.findElements('dc:modified').firstOrNull?.innerText),
      type: element.findElements('dc:type').firstOrNull?.innerText,
      format: element.findElements('dc:format').firstOrNull?.innerText,
      identifier: element.findElements('dc:identifier').firstOrNull?.innerText,
      source: element.findElements('dc:source').firstOrNull?.innerText,
      language: element.findElements('dc:language').firstOrNull?.innerText,
      relation: element.findElements('dc:relation').firstOrNull?.innerText,
      coverage: element.findElements('dc:coverage').firstOrNull?.innerText,
      rights: element.findElements('dc:rights').firstOrNull?.innerText,
    );
  }
}
