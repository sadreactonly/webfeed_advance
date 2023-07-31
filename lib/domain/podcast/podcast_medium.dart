import 'package:xml/xml.dart';

/// Enum representing different types of mediums.
enum MediumType { podcast, music, video, film, audiobook, newsletter, blog }

/// Represents a medium with a value of [MediumType].
///
/// The `Medium` class corresponds to the `medium` element in the podcast namespace.
class Medium {
  /// The value of the medium represented by a [MediumType] enum.
  final MediumType value;

  /// Constructor for creating a [Medium] object.
  ///
  /// The constructor initializes a [Medium] object with a required named parameter:
  /// - [value]: The value of the medium represented by a [MediumType] enum.
  Medium({
    required this.value,
  });

  /// Factory method to parse an [XmlElement] and create a [Medium] object from it.
  ///
  /// The [element] is an XML element containing the medium information.
  ///
  /// Returns the parsed [Medium] object.
  factory Medium.parse(XmlElement element) {
    return Medium(
      value: _parseMediumType(element.innerText),
    );
  }
}

/// Parses the [value] string and returns the corresponding [MediumType].
MediumType _parseMediumType(String value) {
  switch (value) {
    case 'podcast':
      return MediumType.podcast;
    case 'music':
      return MediumType.music;
    case 'video':
      return MediumType.video;
    case 'film':
      return MediumType.film;
    case 'audiobook':
      return MediumType.audiobook;
    case 'newsletter':
      return MediumType.newsletter;
    case 'blog':
      return MediumType.blog;
    default:
      return MediumType.podcast;
  }
}
