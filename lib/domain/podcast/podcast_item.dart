import 'package:webfeed_advanced/domain/media/license.dart';
import 'package:webfeed_advanced/domain/podcast/podcast_alternate_enclosure.dart';
import 'package:webfeed_advanced/domain/podcast/podcast_chapters.dart';
import 'package:webfeed_advanced/domain/podcast/podcast_content_link.dart';
import 'package:webfeed_advanced/domain/podcast/podcast_episode.dart';
import 'package:webfeed_advanced/domain/podcast/podcast_images.dart';
import 'package:webfeed_advanced/domain/podcast/podcast_location.dart';
import 'package:webfeed_advanced/domain/podcast/podcast_person.dart';
import 'package:webfeed_advanced/domain/podcast/podcast_season.dart';
import 'package:webfeed_advanced/domain/podcast/podcast_soundbite.dart';
import 'package:webfeed_advanced/domain/podcast/podcast_transcript.dart';
import 'package:webfeed_advanced/domain/podcast/podcast_value.dart';
import 'package:webfeed_advanced/util/iterable.dart';
import 'package:xml/xml.dart';

/// Represents a podcast item with various attributes such as transcript, chapters, soundbites, people, etc.
///
/// The `PodcastItem` class corresponds to the `podcast:item` element in the podcast namespace.
class PodcastItem {
  /// The transcript associated with the podcast item.
  final Transcript? transcript;

  /// The chapters associated with the podcast item.
  final Chapters? chapters;

  /// The list of soundbites associated with the podcast item.
  final List<Soundbite> soundbites;

  /// The list of people associated with the podcast item.
  final List<Person> people;

  /// The location associated with the podcast item.
  final Location? location;

  /// The season associated with the podcast item.
  final Season? season;

  /// The episode associated with the podcast item.
  final Episode? episode;

  /// The license associated with the podcast item.
  final License? license;

  /// The list of alternate enclosures associated with the podcast item.
  final List<AlternateEnclosure> alternateEnclosures;

  /// The value associated with the podcast item.
  final Value? value;

  /// The images associated with the podcast item.
  final Images? images;

  /// The list of content links associated with the podcast item.
  final List<ContentLink> contentLinks;

  /// Constructor for creating a [PodcastItem] object.
  ///
  /// The constructor initializes a [PodcastItem] object with optional named parameters:
  /// - [transcript]: The transcript associated with the podcast item.
  /// - [chapters]: The chapters associated with the podcast item.
  /// - [soundbites]: The list of soundbites associated with the podcast item.
  /// - [people]: The list of people associated with the podcast item.
  /// - [location]: The location associated with the podcast item.
  /// - [season]: The season associated with the podcast item.
  /// - [episode]: The episode associated with the podcast item.
  /// - [license]: The license associated with the podcast item.
  /// - [alternateEnclosures]: The list of alternate enclosures associated with the podcast item.
  /// - [value]: The value associated with the podcast item.
  /// - [images]: The images associated with the podcast item.
  /// - [contentLinks]: The list of content links associated with the podcast item.
  PodcastItem({
    this.transcript,
    this.chapters,
    required this.soundbites,
    required this.people,
    this.location,
    this.season,
    this.episode,
    this.license,
    required this.alternateEnclosures,
    this.value,
    this.images,
    required this.contentLinks,
  });

  /// Factory method to parse an [XmlElement] and create a [PodcastItem] object from it.
  ///
  /// The [element] is an XML element containing the podcast item information.
  ///
  /// Returns the parsed [PodcastItem] object.
  factory PodcastItem.parse(XmlElement element) {
    return PodcastItem(
      transcript: element
          .findElements('podcast:transcript')
          .map((e) => Transcript.parse(e))
          .firstOrNull,
      chapters: element
          .findElements('podcast:chapters')
          .map((e) => Chapters.parse(e))
          .firstOrNull,
      soundbites: element
          .findElements('podcast:soundbite')
          .map((e) => Soundbite.parse(e))
          .toList(),
      people: element
          .findElements('podcast:person')
          .map((e) => Person.parse(e))
          .toList(),
      location: element
          .findElements('podcast:location')
          .map((e) => Location.parse(e))
          .firstOrNull,
      season: element
          .findElements('podcast:season')
          .map((e) => Season.parse(e))
          .firstOrNull,
      episode: element
          .findElements('podcast:episode')
          .map((e) => Episode.parse(e))
          .firstOrNull,
      license: element
          .findElements('podcast:license')
          .map((e) => License.parse(e))
          .firstOrNull,
      alternateEnclosures: element
          .findElements('podcast:alternateEnclosure')
          .map((e) => AlternateEnclosure.parse(e))
          .toList(),
      value: element
          .findElements('podcast:value')
          .map((e) => Value.parse(e))
          .firstOrNull,
      images: element
          .findElements('podcast:images')
          .map((e) => Images.parse(e))
          .firstOrNull,
      contentLinks: element
          .findElements('podcast:contentLink')
          .map((e) => ContentLink.parse(e))
          .toList(),
    );
  }
}
