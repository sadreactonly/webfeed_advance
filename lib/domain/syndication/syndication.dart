import 'package:webfeed_advanced/util/datetime.dart';
import 'package:webfeed_advanced/util/iterable.dart';
import 'package:xml/xml.dart';

/// Enum representing different update periods for syndication.
enum SyndicationUpdatePeriod { hourly, daily, weekly, monthly, yearly }

/// Represents syndication metadata for an RSS feed.
class Syndication {
  final SyndicationUpdatePeriod? updatePeriod;
  final int? updateFrequency;
  final DateTime? updateBase;

  /// Constructor for the `Syndication` class.
  ///
  /// Initialize the syndication properties such as [updatePeriod], [updateFrequency], and [updateBase].
  Syndication({
    this.updatePeriod,
    this.updateFrequency,
    this.updateBase,
  });

  /// Factory method to create a `Syndication` object from an XML element representing syndication information.
  ///
  /// This method parses the [element] and extracts the relevant syndication information from it
  /// to create a `Syndication` object and returns it.
  ///
  /// The extracted syndication information includes the update period, update frequency, and update base.
  /// If any of the values are not present or cannot be parsed, default values will be used.
  factory Syndication.parse(XmlElement element) {
    SyndicationUpdatePeriod updatePeriod;
    switch (element.findElements('sy:updatePeriod').firstOrNull?.innerText) {
      case 'hourly':
        updatePeriod = SyndicationUpdatePeriod.hourly;
        break;
      case 'daily':
        updatePeriod = SyndicationUpdatePeriod.daily;
        break;
      case 'weekly':
        updatePeriod = SyndicationUpdatePeriod.weekly;
        break;
      case 'monthly':
        updatePeriod = SyndicationUpdatePeriod.monthly;
        break;
      case 'yearly':
        updatePeriod = SyndicationUpdatePeriod.yearly;
        break;
      default:
        updatePeriod = SyndicationUpdatePeriod.daily;
        break;
    }
    return Syndication(
      updatePeriod: updatePeriod,
      updateFrequency: int.tryParse(
          element.findElements('sy:updateFrequency').firstOrNull?.innerText ??
              '1'),
      updateBase: parseDateTime(
          element.findElements('sy:updateBase').firstOrNull?.innerText),
    );
  }
}
