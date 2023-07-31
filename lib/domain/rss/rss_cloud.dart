import 'package:xml/xml.dart';

/// Represents the `<cloud>` element in an RSS feed.
///
/// The `<cloud>` element provides information about an RSS cloud service
/// for notifications and updates.
class RssCloud {
  final String? domain;
  final String? port;
  final String? path;
  final String? registerProcedure;
  final String? protocol;

  /// Constructor for the `RssCloud` class.
  ///
  /// Initialize the RSS cloud properties [domain], [port], [path], [registerProcedure], and [protocol].
  RssCloud(
    this.domain,
    this.port,
    this.path,
    this.registerProcedure,
    this.protocol,
  );

  /// Factory method to create an `RssCloud` object from an [XmlElement].
  ///
  /// This method parses the [node] and extracts the attributes ('domain', 'port', 'path', 'registerProcedure', and 'protocol')
  /// from it to create an `RssCloud` object and returns it.
  ///
  /// The extracted attribute values are assigned to the corresponding properties of the `RssCloud` object.
  factory RssCloud.parse(XmlElement node) {
    var domain = node.getAttribute('domain');
    var port = node.getAttribute('port');
    var path = node.getAttribute('path');
    var registerProcedure = node.getAttribute('registerProcedure');
    var protocol = node.getAttribute('protocol');
    return RssCloud(domain, port, path, registerProcedure, protocol);
  }
}
