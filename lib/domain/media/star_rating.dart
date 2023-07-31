import 'package:xml/xml.dart';

/// Represents a star rating with average, count, min, and max attributes.
class StarRating {
  /// The average attribute value of the star rating.
  final double? average;

  /// The count attribute value of the star rating.
  final int? count;

  /// The min attribute value of the star rating.
  final int? min;

  /// The max attribute value of the star rating.
  final int? max;

  /// Constructor for creating a [StarRating] object.
  ///
  /// The constructor initializes a [StarRating] object with optional named parameters:
  /// - [average]: The average attribute value of the star rating.
  /// - [count]: The count attribute value of the star rating.
  /// - [min]: The min attribute value of the star rating.
  /// - [max]: The max attribute value of the star rating.
  StarRating({
    this.average,
    this.count,
    this.min,
    this.max,
  });

  /// Factory method to parse an [XmlElement] and create a [StarRating] object from it.
  ///
  /// The [element] is an XML element containing the star rating information.
  ///
  /// Returns the parsed [StarRating] object.
  factory StarRating.parse(XmlElement? element) {
    return StarRating(
      average: double.tryParse(element?.getAttribute('average') ?? '0'),
      count: int.tryParse(element?.getAttribute('count') ?? '0'),
      min: int.tryParse(element?.getAttribute('min') ?? '0'),
      max: int.tryParse(element?.getAttribute('max') ?? '0'),
    );
  }
}
