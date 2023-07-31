import 'package:webfeed_advanced/util/iterable.dart';
import 'package:xml/xml.dart';

/// Represents a scene with title, description, startTime, and endTime attributes.
class Scene {
  /// The title of the scene.
  final String? title;

  /// The description of the scene.
  final String? description;

  /// The start time of the scene.
  final String? startTime;

  /// The end time of the scene.
  final String? endTime;

  /// Constructor for creating a [Scene] object.
  ///
  /// The constructor initializes a [Scene] object with optional named parameters:
  /// - [title]: The title of the scene.
  /// - [description]: The description of the scene.
  /// - [startTime]: The start time of the scene.
  /// - [endTime]: The end time of the scene.
  Scene({
    this.title,
    this.description,
    this.startTime,
    this.endTime,
  });

  /// Factory method to parse an [XmlElement] and create a [Scene] object from it.
  ///
  /// The [element] is an XML element containing the scene information.
  ///
  /// Returns the parsed [Scene] object.
  factory Scene.parse(XmlElement element) {
    return Scene(
      title: element.findElements('sceneTitle').firstOrNull?.innerText,
      description:
          element.findElements('sceneDescription').firstOrNull?.innerText,
      startTime: element.findElements('sceneStartTime').firstOrNull?.innerText,
      endTime: element.findElements('sceneEndTime').firstOrNull?.innerText,
    );
  }
}
