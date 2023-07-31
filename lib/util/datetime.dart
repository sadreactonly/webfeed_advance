import 'package:intl/intl.dart';

/// Date pattern used in RFC 822 formatted dates.
const rfc822DatePattern = 'EEE, dd MMM yyyy HH:mm:ss Z';

/// Parse a date-time string into a DateTime object.
///
/// The function attempts to parse the [dateString] into a DateTime object
/// using two different date formats: RFC 822 and ISO 8601.
/// If the [dateString] is null or cannot be parsed into a DateTime object,
/// the function returns null.
DateTime? parseDateTime(dateString) {
  if (dateString == null) return null;
  return _parseRfc822DateTime(dateString) ?? _parseIso8601DateTime(dateString);
}

/// Parse a date-time string in RFC 822 format into a DateTime object.
///
/// The function attempts to parse the [dateString] using the RFC 822 date pattern.
/// Some feeds may use a shortened version of the RFC 822 date, in which case,
/// the function trims the pattern before attempting to parse it.
/// If the [dateString] is null or cannot be parsed into a DateTime object,
/// the function returns null.
DateTime? _parseRfc822DateTime(String dateString) {
  try {
    final num? length = dateString.length.clamp(0, rfc822DatePattern.length);
    final trimmedPattern = rfc822DatePattern.substring(0, length as int?);
    final format = DateFormat(trimmedPattern, 'en_US');
    return format.parse(dateString);
  } on FormatException {
    return null;
  }
}

/// Parse a date-time string in ISO 8601 format into a DateTime object.
///
/// The function attempts to parse the [dateString] using the DateTime.parse method.
/// If the [dateString] is null or cannot be parsed into a DateTime object,
/// the function returns null.
DateTime? _parseIso8601DateTime(dateString) {
  try {
    return DateTime.parse(dateString);
  } on FormatException {
    return null;
  }
}
