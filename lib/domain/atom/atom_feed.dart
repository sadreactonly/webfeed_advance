import 'package:webfeed_advanced/domain/atom/atom_category.dart';
import 'package:webfeed_advanced/domain/atom/atom_generator.dart';
import 'package:webfeed_advanced/domain/atom/atom_item.dart';
import 'package:webfeed_advanced/domain/atom/atom_link.dart';
import 'package:webfeed_advanced/domain/atom/atom_person.dart';
import 'package:webfeed_advanced/util/datetime.dart';
import 'package:webfeed_advanced/util/iterable.dart';
import 'package:xml/xml.dart';

/// Represents an Atom feed.
///
/// The `AtomFeed` class corresponds to an Atom feed containing information about the feed itself and its entries (items).
class AtomFeed {
  /// The unique identifier for the feed.
  final String? id;

  /// The title of the feed.
  final String? title;

  /// The date and time when the feed was last updated.
  final DateTime? updated;

  /// The list of items (entries) in the feed.
  final List<AtomItem>? items;

  /// The list of links related to the feed.
  final List<AtomLink>? links;

  /// The list of authors of the feed.
  final List<AtomPerson>? authors;

  /// The list of contributors to the feed.
  final List<AtomPerson>? contributors;

  /// The list of categories associated with the feed.
  final List<AtomCategory>? categories;

  /// The generator information for the feed.
  final AtomGenerator? generator;

  /// The URL to an icon representing the feed.
  final String? icon;

  /// The URL to a logo representing the feed.
  final String? logo;

  /// The rights information for the feed.
  final String? rights;

  /// The subtitle or tagline of the feed.
  final String? subtitle;

  /// Constructor for creating an [AtomFeed] object.
  ///
  /// The constructor initializes an [AtomFeed] object with the following parameters:
  /// - [id]: The unique identifier for the feed.
  /// - [title]: The title of the feed.
  /// - [updated]: The date and time when the feed was last updated.
  /// - [items]: The list of items (entries) in the feed.
  /// - [links]: The list of links related to the feed.
  /// - [authors]: The list of authors of the feed.
  /// - [contributors]: The list of contributors to the feed.
  /// - [categories]: The list of categories associated with the feed.
  /// - [generator]: The generator information for the feed.
  /// - [icon]: The URL to an icon representing the feed.
  /// - [logo]: The URL to a logo representing the feed.
  /// - [rights]: The rights information for the feed.
  /// - [subtitle]: The subtitle or tagline of the feed.
  AtomFeed({
    this.id,
    this.title,
    this.updated,
    this.items,
    this.links,
    this.authors,
    this.contributors,
    this.categories,
    this.generator,
    this.icon,
    this.logo,
    this.rights,
    this.subtitle,
  });

  /// Factory method to parse an XML string and create an [AtomFeed] object from it.
  ///
  /// The [xmlString] is an XML representation of the Atom feed.
  ///
  /// Returns the parsed [AtomFeed] object.
  factory AtomFeed.parse(String xmlString) {
    var document = XmlDocument.parse(xmlString);
    var feedElement = document.findElements('feed').firstOrNull;
    if (feedElement == null) {
      throw ArgumentError('feed not found');
    }

    return AtomFeed._fromXml(feedElement);
  }

  /// Factory method to create an [AtomFeed] object from an [XmlElement].
  ///
  /// The [feedElement] is an XML element containing the Atom feed information.
  ///
  /// Returns the parsed [AtomFeed] object.
  factory AtomFeed.fromXml(XmlElement feedElement) {
    return AtomFeed._fromXml(feedElement);
  }

  /// Internal factory method to create an [AtomFeed] object from an [XmlElement].
  ///
  /// The [feedElement] is an XML element containing the Atom feed information.
  ///
  /// Returns the parsed [AtomFeed] object.
  factory AtomFeed._fromXml(XmlElement feedElement) {
    return AtomFeed(
      id: feedElement.findElements('id').firstOrNull?.innerText,
      title: feedElement.findElements('title').firstOrNull?.innerText,
      updated: parseDateTime(
          feedElement.findElements('updated').firstOrNull?.innerText),
      items: feedElement
          .findElements('entry')
          .map((e) => AtomItem.parse(e))
          .toList(),
      links: feedElement
          .findElements('link')
          .map((e) => AtomLink.parse(e))
          .toList(),
      authors: feedElement
          .findElements('author')
          .map((e) => AtomPerson.parse(e))
          .toList(),
      contributors: feedElement
          .findElements('contributor')
          .map((e) => AtomPerson.parse(e))
          .toList(),
      categories: feedElement
          .findElements('category')
          .map((e) => AtomCategory.parse(e))
          .toList(),
      generator: feedElement
          .findElements('generator')
          .map((e) => AtomGenerator.parse(e))
          .firstOrNull,
      icon: feedElement.findElements('icon').firstOrNull?.innerText,
      logo: feedElement.findElements('logo').firstOrNull?.innerText,
      rights: feedElement.findElements('rights').firstOrNull?.innerText,
      subtitle: feedElement.findElements('subtitle').firstOrNull?.innerText,
    );
  }
}
