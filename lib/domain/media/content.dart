import 'package:xml/xml.dart';

/// Represents the "media:content" element in a media namespace commonly found in RSS feeds.
class Content {
  final String? url; // The URL of the media content.
  final String? type; // The MIME type of the media content.
  final int? fileSize; // The file size of the media content in bytes.
  final String? medium; // The medium of the media content.
  final bool? isDefault; // Indicates if the media content is the default one.
  final String? expression; // The expression of the media content.
  final int? bitrate; // The bitrate of the media content in bits per second.
  final double? framerate; // The framerate of the media content.
  final double? samplingrate; // The sampling rate of the media content.
  final int? channels; // The number of audio channels in the media content.
  final int? duration; // The duration of the media content in seconds.
  final int? height; // The height of the media content in pixels.
  final int? width; // The width of the media content in pixels.
  final String? lang; // The language of the media content.

  /// Constructor for the Content class.
  ///
  /// The constructor initializes a Content object with optional named parameters:
  /// - `url`: The URL of the media content.
  /// - `type`: The MIME type of the media content.
  /// - `fileSize`: The file size of the media content in bytes.
  /// - `medium`: The medium of the media content.
  /// - `isDefault`: Indicates if the media content is the default one.
  /// - `expression`: The expression of the media content.
  /// - `bitrate`: The bitrate of the media content in bits per second.
  /// - `framerate`: The framerate of the media content.
  /// - `samplingrate`: The sampling rate of the media content.
  /// - `channels`: The number of audio channels in the media content.
  /// - `duration`: The duration of the media content in seconds.
  /// - `height`: The height of the media content in pixels.
  /// - `width`: The width of the media content in pixels.
  /// - `lang`: The language of the media content.
  ///
  /// All parameters are optional and can be set to null if not provided.
  Content({
    this.url,
    this.type,
    this.fileSize,
    this.medium,
    this.isDefault,
    this.expression,
    this.bitrate,
    this.framerate,
    this.samplingrate,
    this.channels,
    this.duration,
    this.height,
    this.width,
    this.lang,
  });

  /// Factory method to create a new Content instance from an XML element.
  ///
  /// The factory constructor takes an [XmlElement] representing the "media:content" element
  /// and extracts its attributes 'url', 'type', 'fileSize', 'medium', 'isDefault', 'expression',
  /// 'bitrate', 'framerate', 'samplingrate', 'channels', 'duration', 'height', and 'width'.
  /// It uses int.tryParse and double.tryParse methods to parse numeric attributes and initializes
  /// the properties of the Content object with these values. The 'isDefault' attribute is parsed
  /// as a boolean.
  factory Content.parse(XmlElement element) {
    return Content(
      url: element.getAttribute('url'), // Extract the 'url' attribute.
      type: element.getAttribute('type'), // Extract the 'type' attribute.
      fileSize: int.tryParse(element.getAttribute('fileSize') ??
          '0'), // Extract and parse 'fileSize' attribute.
      medium: element.getAttribute('medium'), // Extract the 'medium' attribute.
      isDefault: element.getAttribute('isDefault') ==
          'true', // Parse 'isDefault' attribute as a boolean.
      expression: element
          .getAttribute('expression'), // Extract the 'expression' attribute.
      bitrate: int.tryParse(element.getAttribute('bitrate') ??
          '0'), // Extract and parse 'bitrate' attribute.
      framerate: double.tryParse(element.getAttribute('framerate') ??
          '0'), // Extract and parse 'framerate' attribute.
      samplingrate: double.tryParse(element.getAttribute('samplingrate') ??
          '0'), // Extract and parse 'samplingrate' attribute.
      channels: int.tryParse(element.getAttribute('channels') ??
          '0'), // Extract and parse 'channels' attribute.
      duration: int.tryParse(element.getAttribute('duration') ??
          '0'), // Extract and parse 'duration' attribute.
      height: int.tryParse(element.getAttribute('height') ??
          '0'), // Extract and parse 'height' attribute.
      width: int.tryParse(element.getAttribute('width') ??
          '0'), // Extract and parse 'width' attribute.
      lang: element.getAttribute('lang'), // Extract the 'lang' attribute.
    );
  }
}
