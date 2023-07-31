import 'package:webfeed_advance/domain/media/category.dart';
import 'package:webfeed_advance/domain/media/content.dart';
import 'package:webfeed_advance/domain/media/credit.dart';
import 'package:webfeed_advance/domain/media/description.dart';
import 'package:webfeed_advance/domain/media/rating.dart';
import 'package:webfeed_advance/domain/media/thumbnail.dart';
import 'package:webfeed_advance/domain/media/title.dart';
import 'package:webfeed_advance/util/iterable.dart';
import 'package:xml/xml.dart';

/// Represents the "media:group" element in an XML document.
class Group {
  final List<Content>?
      contents; // List of Content objects representing media contents.
  final List<Credit>?
      credits; // List of Credit objects representing media credits.
  final Category? category; // Category object representing the media category.
  final Rating? rating; // Rating object representing the media rating.
  final Thumbnail?
      thumbnail; // Thumbnail object representing the media thumbnail.
  final Title? title; // Title object representing the media title.
  final Description?
      description; // Description object representing the media description.

  /// Constructor for the Group class.
  ///
  /// The constructor initializes a Group object with optional named parameters:
  /// - `contents`: List of Content objects representing media contents.
  /// - `credits`: List of Credit objects representing media credits.
  /// - `category`: Category object representing the media category.
  /// - `rating`: Rating object representing the media rating.
  /// - `thumbnail`: Thumbnail object representing the media thumbnail.
  /// - `title`: Title object representing the media title.
  /// - `description`: Description object representing the media description.
  Group({
    this.contents,
    this.credits,
    this.category,
    this.rating,
    this.thumbnail,
    this.title,
    this.description,
  });

  /// Factory method to create a new Group instance from an XML element.
  ///
  /// The factory constructor takes an [XmlElement] representing the "media:group" element
  /// and extracts its child elements "media:content", "media:credit", "media:category",
  /// "media:rating", "media:thumbnail", "media:title", and "media:description".
  /// It uses these values to initialize the properties of the Group object.
  factory Group.parse(XmlElement element) {
    return Group(
      contents: element
          .findElements(
              'media:content') // Find all child "media:content" elements.
          .map((e) => Content.parse(
              e)) // Convert each child element to a Content object.
          .toList(), // Convert the iterable to a list.
      credits: element
          .findElements(
              'media:credit') // Find all child "media:credit" elements.
          .map((e) =>
              Credit.parse(e)) // Convert each child element to a Credit object.
          .toList(), // Convert the iterable to a list.
      category: element
          .findElements(
              'media:category') // Find the child "media:category" element.
          .map((e) => Category.parse(
              e)) // Convert the child element to a Category object.
          .firstOrNull, // Get the first Category object or null if not found.
      rating: element
          .findElements(
              'media:rating') // Find the child "media:rating" element.
          .map((e) =>
              Rating.parse(e)) // Convert the child element to a Rating object.
          .firstOrNull, // Get the first Rating object or null if not found.
      thumbnail: element
          .findElements(
              'media:thumbnail') // Find the child "media:thumbnail" element.
          .map((e) => Thumbnail.parse(
              e)) // Convert the child element to a Thumbnail object.
          .firstOrNull, // Get the first Thumbnail object or null if not found.
      title: element
          .findElements('media:title') // Find the child "media:title" element.
          .map((e) =>
              Title.parse(e)) // Convert the child element to a Title object.
          .firstOrNull, // Get the first Title object or null if not found.
      description: element
          .findElements(
              'media:description') // Find the child "media:description" element.
          .map((e) => Description.parse(
              e)) // Convert the child element to a Description object.
          .firstOrNull, // Get the first Description object or null if not found.
    );
  }
}
