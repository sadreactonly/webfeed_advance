import 'package:xml/xml.dart';

/// Represents an iTunes category and its subcategories.
class ItunesCategory {
  final String? category;
  final List<String>? subCategories;

  /// Constructor for the `ItunesCategory` class.
  ///
  /// Initialize the iTunes category [category] and its [subCategories].
  ItunesCategory({this.category, this.subCategories});

  /// Factory method to create an `ItunesCategory` object from an [XmlElement].
  ///
  /// This method parses the [element] and extracts the category and subcategory information from it
  /// to create an `ItunesCategory` object and returns it.
  ///
  /// The [category] value is obtained from the 'text' attribute of the [element].
  /// The [subCategories] value is obtained by looking for 'itunes:category' elements within the [element],
  /// and then extracting the 'text' attribute from each subcategory element.
  /// The extracted values are stored in a list, and the list is assigned to the [subCategories] property.
  ///
  /// Both [category] and [subCategories] values are trimmed before assigning them to remove leading/trailing spaces.
  factory ItunesCategory.parse(XmlElement element) {
    return ItunesCategory(
      category: element.getAttribute('text')?.trim(),
      subCategories: element
          .findElements('itunes:category')
          .map((e) => e.getAttribute('text')?.trim() ?? '')
          .toList(),
    );
  }
}
