import 'package:webfeed_advance/util/iterable.dart';
import 'package:xml/xml.dart';

/// Represents the iTunes owner information.
class ItunesOwner {
  final String? name;
  final String? email;

  /// Constructor for the `ItunesOwner` class.
  ///
  /// Initialize the iTunes owner properties [name] and [email].
  ItunesOwner({this.name, this.email});

  /// Factory method to create an `ItunesOwner` object from an [XmlElement].
  ///
  /// This method parses the [element] and extracts the iTunes owner's name and email information from it
  /// to create an `ItunesOwner` object and returns it.
  ///
  /// The [name] and [email] values are obtained by looking for 'itunes:name' and 'itunes:email' elements
  /// within the [element], respectively. The inner text of these elements is used as the corresponding value.
  /// The inner text is trimmed before assigning it to the [name] and [email] properties to remove leading/trailing spaces.
  factory ItunesOwner.parse(XmlElement element) {
    return ItunesOwner(
      name: element.findElements('itunes:name').firstOrNull?.innerText.trim(),
      email: element.findElements('itunes:email').firstOrNull?.innerText.trim(),
    );
  }
}
