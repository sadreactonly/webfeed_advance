import 'package:xml/xml.dart';

/// Represents a player with URL, width, height, and value attributes.
class Player {
  /// The URL attribute value of the player.
  final String? url;

  /// The width attribute value of the player.
  final int? width;

  /// The height attribute value of the player.
  final int? height;

  /// The value of the player.
  final String? value;

  /// Constructor for creating a [Player] object.
  ///
  /// The constructor initializes a [Player] object with optional named parameters:
  /// - [url]: The URL attribute value of the player.
  /// - [width]: The width attribute value of the player.
  /// - [height]: The height attribute value of the player.
  /// - [value]: The value of the player.
  Player({
    this.url,
    this.width,
    this.height,
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create a [Player] object from it.
  ///
  /// The [element] is an XML element containing the player information.
  ///
  /// Returns the parsed [Player] object.
  factory Player.parse(XmlElement element) {
    return Player(
      url: element.getAttribute('url'),
      width: int.tryParse(element.getAttribute('width') ?? '0'),
      height: int.tryParse(element.getAttribute('height') ?? '0'),
      value: element.innerText,
    );
  }
}
