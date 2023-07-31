import 'package:xml/xml.dart';

/// An enumeration representing the different types of iTunes episodes.
enum ItunesEpisodeType {
  /// Indicates a full episode.
  full,

  /// Indicates a trailer episode.
  trailer,

  /// Indicates a bonus episode.
  bonus,

  /// Indicates an unknown type of iTunes episode.
  unknown,
}

/// Creates an `ItunesEpisodeType` value based on the inner text of the given [XmlElement].
///
/// This function takes an [XmlElement] and checks its inner text to determine the type of the iTunes episode.
/// It returns the corresponding `ItunesEpisodeType` value based on the inner text.
///
/// If the inner text matches 'full', [ItunesEpisodeType.full] is returned.
/// If the inner text matches 'trailer', [ItunesEpisodeType.trailer] is returned.
/// If the inner text matches 'bonus', [ItunesEpisodeType.bonus] is returned.
/// Otherwise, [ItunesEpisodeType.unknown] is returned.
ItunesEpisodeType newItunesEpisodeType(XmlElement element) {
  switch (element.innerText) {
    case 'full':
      return ItunesEpisodeType.full;
    case 'trailer':
      return ItunesEpisodeType.trailer;
    case 'bonus':
      return ItunesEpisodeType.bonus;
    default:
      return ItunesEpisodeType.unknown;
  }
}
