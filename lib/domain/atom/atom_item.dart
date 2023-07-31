import 'package:webfeed_advanced/domain/atom/atom_category.dart';
import 'package:webfeed_advanced/domain/atom/atom_link.dart';
import 'package:webfeed_advanced/domain/atom/atom_person.dart';
import 'package:webfeed_advanced/domain/atom/atom_source.dart';
import 'package:webfeed_advanced/domain/media/media.dart';
import 'package:webfeed_advanced/util/datetime.dart';
import 'package:webfeed_advanced/util/iterable.dart';
import 'package:xml/xml.dart';

/// Represents an item in an Atom feed.
///
/// The `AtomItem` class corresponds to the "entry" element in the Atom feed.
class AtomItem {
  /// The unique identifier for the item.
  final String? id;

  /// The title of the item.
  final String? title;

  /// The last updated timestamp for the item.
  final DateTime? updated;

  /// The authors of the item.
  final List<AtomPerson>? authors;

  /// The links related to the item.
  final List<AtomLink>? links;

  /// The categories associated with the item.
  final List<AtomCategory>? categories;

  /// The contributors to the item.
  final List<AtomPerson>? contributors;

  /// The source of the item.
  final AtomSource? source;

  /// The timestamp when the item was published.
  final String? published;

  /// The content of the item.
  final String? content;

  /// The summary of the item.
  final String? summary;

  /// The rights information for the item.
  final String? rights;

  /// The media content associated with the item.
  final Media? media;

  /// Constructor for creating an [AtomItem] object.
  ///
  /// The constructor initializes an [AtomItem] object with the following parameters:
  /// - [id]: The unique identifier for the item.
  /// - [title]: The title of the item.
  /// - [updated]: The last updated timestamp for the item.
  /// - [authors]: The authors of the item.
  /// - [links]: The links related to the item.
  /// - [categories]: The categories associated with the item.
  /// - [contributors]: The contributors to the item.
  /// - [source]: The source of the item.
  /// - [published]: The timestamp when the item was published.
  /// - [content]: The content of the item.
  /// - [summary]: The summary of the item.
  /// - [rights]: The rights information for the item.
  /// - [media]: The media content associated with the item.
  AtomItem({
    this.id,
    this.title,
    this.updated,
    this.authors,
    this.links,
    this.categories,
    this.contributors,
    this.source,
    this.published,
    this.content,
    this.summary,
    this.rights,
    this.media,
  });

  /// Factory method to parse an [XmlElement] and create an [AtomItem] object from it.
  ///
  /// The [element] is an XML element containing the item information.
  ///
  /// Returns the parsed [AtomItem] object.
  factory AtomItem.parse(XmlElement element) {
    return AtomItem(
      id: element.findElements('id').firstOrNull?.innerText,
      title: element.findElements('title').firstOrNull?.innerText,
      updated:
          parseDateTime(element.findElements('updated').firstOrNull?.innerText),
      authors: element
          .findElements('author')
          .map((e) => AtomPerson.parse(e))
          .toList(),
      links:
          element.findElements('link').map((e) => AtomLink.parse(e)).toList(),
      categories: element
          .findElements('category')
          .map((e) => AtomCategory.parse(e))
          .toList(),
      contributors: element
          .findElements('contributor')
          .map((e) => AtomPerson.parse(e))
          .toList(),
      source: element
          .findElements('source')
          .map((e) => AtomSource.parse(e))
          .firstOrNull,
      published: element.findElements('published').firstOrNull?.innerText,
      content: element.findElements('content').firstOrNull?.innerText,
      summary: element.findElements('summary').firstOrNull?.innerText,
      rights: element.findElements('rights').firstOrNull?.innerText,
      media: Media.parse(element),
    );
  }
}
