import 'package:xml/xml.dart';

/// An enumeration representing the different types of iTunes items.
enum ItunesType {
  /// Indicates an iTunes item that is episodic, such as a podcast episode.
  episodic,

  /// Indicates an iTunes item that is part of a serial, such as a podcast series.
  serial,

  /// Indicates an unknown type of iTunes item.
  unknown,
}

/// Creates an `ItunesType` value based on the inner text of the given [XmlElement].
///
/// This function takes an [XmlElement] and checks its inner text to determine the type of the iTunes item.
/// It returns the corresponding `ItunesType` value based on the inner text.
///
/// If the inner text matches 'episodic', [ItunesType.episodic] is returned.
/// If the inner text matches 'serial', [ItunesType.serial] is returned.
/// Otherwise, [ItunesType.unknown] is returned.
ItunesType newItunesType(XmlElement element) {
  switch (element.innerText) {
    case 'episodic':
      return ItunesType.episodic;
    case 'serial':
      return ItunesType.serial;
    default:
      return ItunesType.unknown;
  }
}
