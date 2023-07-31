import 'package:webfeed_advance/domain/media/star_rating.dart';
import 'package:webfeed_advance/domain/media/statistics.dart';
import 'package:webfeed_advance/domain/media/tags.dart';
import 'package:webfeed_advance/util/iterable.dart';
import 'package:xml/xml.dart';

/// Represents the "media:community" element in a media namespace commonly found in RSS feeds.
class Community {
  final StarRating?
      starRating; // The star rating associated with the media content.
  final Statistics? statistics; // Statistics related to the media content.
  final Tags? tags; // Tags associated with the media content.

  /// Constructor for the Community class.
  ///
  /// The constructor initializes a Community object with optional named parameters:
  /// - `starRating`: The star rating associated with the media content.
  /// - `statistics`: Statistics related to the media content.
  /// - `tags`: Tags associated with the media content.
  ///
  /// All parameters are optional and can be set to null if not provided.
  Community({
    this.starRating,
    this.statistics,
    this.tags,
  });

  /// Factory method to create a new Community instance from an XML element.
  ///
  /// The factory constructor takes an [XmlElement] representing the "media:community" element
  /// and extracts its child elements 'media:starRating', 'media:statistics', and 'media:tags'.
  /// It uses the 'StarRating.parse', 'Statistics.parse', and 'Tags.parse' methods to create
  /// corresponding objects from the child elements and initializes the properties of the
  /// Community object with these values.
  factory Community.parse(XmlElement element) {
    return Community(
      starRating: element
          .findElements('media:starRating')
          .map((e) => StarRating.parse(e))
          .firstOrNull, // Extract the first 'media:starRating' child element if present.
      statistics: element
          .findElements('media:statistics')
          .map((e) => Statistics.parse(e))
          .firstOrNull, // Extract the first 'media:statistics' child element if present.
      tags: element
          .findElements('media:tags')
          .map((e) => Tags.parse(e))
          .firstOrNull, // Extract the first 'media:tags' child element if present.
    );
  }
}
