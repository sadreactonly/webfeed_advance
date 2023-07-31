import 'package:xml/xml.dart';

/// Represents a soundbite with startTime, duration, and value attributes.
///
/// The `Soundbite` class corresponds to the `soundbite` element in the podcast namespace.
class Soundbite {
  /// The startTime attribute value of the soundbite.
  final double? startTime;

  /// The duration attribute value of the soundbite.
  final double? duration;

  /// The value of the soundbite.
  final String? value;

  /// Constructor for creating a [Soundbite] object.
  ///
  /// The constructor initializes a [Soundbite] object with optional named parameters:
  /// - [startTime]: The startTime attribute value of the soundbite.
  /// - [duration]: The duration attribute value of the soundbite.
  /// - [value]: The value of the soundbite.
  Soundbite({
    this.startTime,
    this.duration,
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create a [Soundbite] object from it.
  ///
  /// The [element] is an XML element containing the soundbite information.
  ///
  /// Returns the parsed [Soundbite] object.
  factory Soundbite.parse(XmlElement element) {
    final startTimeStr = element.getAttribute('startTime');
    final durationStr = element.getAttribute('duration');
    return Soundbite(
      startTime: startTimeStr != null ? double.tryParse(startTimeStr) : null,
      duration: durationStr != null ? double.tryParse(durationStr) : null,
      value: element.innerText,
    );
  }
}
