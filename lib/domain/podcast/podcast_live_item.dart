import 'package:webfeed_advanced/domain/rss/rss_item.dart';
import 'package:xml/xml.dart';

/// Enum representing different live item statuses.
enum LiveItemStatus { pending, live, ended }

/// Represents a live item with status, start, end, and item attributes.
///
/// The `LiveItem` class corresponds to the `live-item` element in the podcast namespace.
class LiveItem {
  /// The status of the live item represented by a [LiveItemStatus] enum.
  final LiveItemStatus? status;

  /// The start time of the live item.
  final DateTime? start;

  /// The end time of the live item.
  final DateTime? end;

  /// The [RssItem] associated with the live item.
  final RssItem item;

  /// Constructor for creating a [LiveItem] object.
  ///
  /// The constructor initializes a [LiveItem] object with optional named parameters:
  /// - [status]: The status of the live item represented by a [LiveItemStatus] enum.
  /// - [start]: The start time of the live item.
  /// - [end]: The end time of the live item.
  /// - [item]: The [RssItem] associated with the live item.
  LiveItem({
    this.status,
    this.start,
    this.end,
    required this.item,
  });

  /// Factory method to parse an [XmlElement] and create a [LiveItem] object from it.
  ///
  /// The [element] is an XML element containing the live item information.
  ///
  /// Returns the parsed [LiveItem] object.
  factory LiveItem.parse(XmlElement element) {
    final startStr = element.getAttribute('start');
    final endStr = element.getAttribute('end');
    return LiveItem(
      status: _parseLiveItemStatusType(element.getAttribute('status')),
      start: startStr == null ? null : DateTime.tryParse(startStr),
      end: endStr == null ? null : DateTime.tryParse(endStr),
      item: RssItem.parse(element),
    );
  }
}

/// Parses the [value] string and returns the corresponding [LiveItemStatus].
LiveItemStatus? _parseLiveItemStatusType(String? value) {
  switch (value) {
    case 'pending':
      return LiveItemStatus.pending;
    case 'live':
      return LiveItemStatus.live;
    case 'ended':
      return LiveItemStatus.ended;
    default:
      return null;
  }
}
