import 'package:webfeed_advance/domain/media/license.dart';
import 'package:webfeed_advance/domain/podcast/podcast_funding.dart';
import 'package:webfeed_advance/domain/podcast/podcast_guid.dart';
import 'package:webfeed_advance/domain/podcast/podcast_images.dart';
import 'package:webfeed_advance/domain/podcast/podcast_live_item.dart';
import 'package:webfeed_advance/domain/podcast/podcast_location.dart';
import 'package:webfeed_advance/domain/podcast/podcast_locked.dart';
import 'package:webfeed_advance/domain/podcast/podcast_medium.dart';
import 'package:webfeed_advance/domain/podcast/podcast_person.dart';
import 'package:webfeed_advance/domain/podcast/podcast_trailer.dart';
import 'package:webfeed_advance/domain/podcast/podcast_value.dart';
import 'package:webfeed_advance/util/iterable.dart';
import 'package:xml/xml.dart';

/// Represents a podcast feed with various metadata and items.
///
/// The `Podcast` class corresponds to the root element of the podcast namespace.
class Podcast {
  /// The locked status of the podcast.
  final Locked? locked;

  /// The funding information of the podcast.
  final Funding? funding;

  /// The list of people associated with the podcast.
  final List<Person> people;

  /// The location information of the podcast.
  final Location? location;

  /// The list of trailers associated with the podcast.
  final List<Trailer> trailers;

  /// The license information of the podcast.
  final License? license;

  /// The GUID (Globally Unique Identifier) of the podcast.
  final Guid? guid;

  /// The value associated with the podcast.
  final Value? value;

  /// The medium type of the podcast.
  final Medium? medium;

  /// The images associated with the podcast.
  final Images? images;

  /// The list of live items associated with the podcast.
  final List<LiveItem> liveItems;

  /// Constructor for creating a [Podcast] object.
  ///
  /// The constructor initializes a [Podcast] object with the following named parameters:
  /// - [locked]: The locked status of the podcast.
  /// - [funding]: The funding information of the podcast.
  /// - [people]: The list of people associated with the podcast.
  /// - [location]: The location information of the podcast.
  /// - [trailers]: The list of trailers associated with the podcast.
  /// - [license]: The license information of the podcast.
  /// - [guid]: The GUID (Globally Unique Identifier) of the podcast.
  /// - [value]: The value associated with the podcast.
  /// - [medium]: The medium type of the podcast.
  /// - [images]: The images associated with the podcast.
  /// - [liveItems]: The list of live items associated with the podcast.
  Podcast({
    this.locked,
    this.funding,
    required this.people,
    this.location,
    required this.trailers,
    this.license,
    this.guid,
    this.value,
    this.medium,
    this.images,
    required this.liveItems,
  });

  /// Factory method to parse an [XmlElement] and create a [Podcast] object from it.
  ///
  /// The [element] is an XML element containing the podcast information.
  ///
  /// Returns the parsed [Podcast] object.
  factory Podcast.parse(XmlElement element) {
    return Podcast(
      locked: element
          .findElements('podcast:locked')
          .map((e) => Locked.parse(e))
          .firstOrNull,
      funding: element
          .findElements('podcast:funding')
          .map((e) => Funding.parse(e))
          .firstOrNull,
      people: element
          .findElements('podcast:person')
          .map((e) => Person.parse(e))
          .toList(),
      location: element
          .findElements('podcast:location')
          .map((e) => Location.parse(e))
          .firstOrNull,
      trailers: element
          .findElements('podcast:trailer')
          .map((e) => Trailer.parse(e))
          .toList(),
      license: element
          .findElements('podcast:license')
          .map((e) => License.parse(e))
          .firstOrNull,
      guid: element
          .findElements('podcast:guid')
          .map((e) => Guid.parse(e))
          .firstOrNull,
      value: element
          .findElements('podcast:value')
          .map((e) => Value.parse(e))
          .firstOrNull,
      medium: element
          .findElements('podcast:medium')
          .map((e) => Medium.parse(e))
          .firstOrNull,
      images: element
          .findElements('podcast:images')
          .map((e) => Images.parse(e))
          .firstOrNull,
      liveItems: element
          .findElements('podcast:liveItem')
          .map((e) => LiveItem.parse(e))
          .toList(),
    );
  }
}
