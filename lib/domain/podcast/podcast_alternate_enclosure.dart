import 'package:webfeed_advanced/domain/podcast/podcast_integrity.dart';
import 'package:webfeed_advanced/domain/podcast/podcast_source.dart';
import 'package:xml/xml.dart';

/// Represents an alternate enclosure in a podcast episode or item.
///
/// The `AlternateEnclosure` class corresponds to the `podcast:alternateEnclosure` element in the podcast namespace.
class AlternateEnclosure {
  /// The type of the alternate enclosure.
  final String? type;

  /// The length of the alternate enclosure in bytes.
  final int? length;

  /// The bitrate of the alternate enclosure in kbps (kilobits per second).
  final double? bitrate;

  /// The height of the alternate enclosure in pixels (for video).
  final int? height;

  /// The language of the alternate enclosure.
  final String? lang;

  /// The title of the alternate enclosure.
  final String? title;

  /// The relationship of the alternate enclosure to the main enclosure.
  final String? rel;

  /// The codecs used for the alternate enclosure (for media files).
  final String? codecs;

  /// The default status of the alternate enclosure.
  final String? default_;

  /// The list of sources for the alternate enclosure.
  final List<Source> sources;

  /// The list of integrities for the alternate enclosure.
  final List<Integrity> integrities;

  /// Constructor for creating an [AlternateEnclosure] object.
  ///
  /// The constructor initializes an [AlternateEnclosure] object with the following named parameters:
  /// - [type]: The type of the alternate enclosure.
  /// - [length]: The length of the alternate enclosure in bytes.
  /// - [bitrate]: The bitrate of the alternate enclosure in kbps (kilobits per second).
  /// - [height]: The height of the alternate enclosure in pixels (for video).
  /// - [lang]: The language of the alternate enclosure.
  /// - [title]: The title of the alternate enclosure.
  /// - [rel]: The relationship of the alternate enclosure to the main enclosure.
  /// - [codecs]: The codecs used for the alternate enclosure (for media files).
  /// - [default_]: The default status of the alternate enclosure.
  /// - [sources]: The list of sources for the alternate enclosure.
  /// - [integrities]: The list of integrities for the alternate enclosure.
  AlternateEnclosure({
    this.type,
    this.length,
    this.bitrate,
    this.height,
    this.lang,
    this.title,
    this.rel,
    this.codecs,
    this.default_,
    required this.sources,
    required this.integrities,
  });

  /// Factory method to parse an [XmlElement] and create an [AlternateEnclosure] object from it.
  ///
  /// The [element] is an XML element containing the alternate enclosure information.
  ///
  /// Returns the parsed [AlternateEnclosure] object.
  factory AlternateEnclosure.parse(XmlElement element) {
    final lengthStr = element.getAttribute('length');
    final bitrateStr = element.getAttribute('bitrate');
    final heightStr = element.getAttribute('height');
    return AlternateEnclosure(
      type: element.getAttribute('type'),
      length: lengthStr == null ? null : int.tryParse(lengthStr),
      bitrate: bitrateStr == null ? null : double.tryParse(bitrateStr),
      height: heightStr == null ? null : int.tryParse(heightStr),
      lang: element.getAttribute('lang'),
      title: element.getAttribute('title'),
      rel: element.getAttribute('rel'),
      codecs: element.getAttribute('codecs'),
      default_: element.getAttribute('default'),
      sources: element
          .findElements('podcast:source')
          .map((e) => Source.parse(e))
          .toList(),
      integrities: element
          .findElements('podcast:integrity')
          .map((e) => Integrity.parse(e))
          .toList(),
    );
  }
}
