import 'package:xml/xml.dart';

/// Represents a custom namespace with a collection of custom tags.
class CustomNamespace {
  final Map<String, dynamic> customTags;

  /// Constructor for the `CustomNamespace` class.
  ///
  /// [customTags] is a map that holds the custom tags with their values.
  CustomNamespace({required this.customTags});

  /// Returns the value associated with the given [key] from the custom tags.
  ///
  /// If the [key] is not found in the custom tags, returns null.
  String? valueForKey(String key) {
    return customTags[key];
  }

  /// Factory method to create a `CustomNamespace` object from an [XmlElement].
  ///
  /// This method parses the [element] and extracts its descendant elements to create a map of custom tags.
  /// It then uses this map to initialize a `CustomNamespace` object and returns it.
  factory CustomNamespace.parse(XmlElement element) {
    final customTags = <String, dynamic>{};

    // Loop through all the descendant elements of the given [element].
    element.descendantElements.forEach((descendantElement) {
      // Add the name and inner text of each descendant element to the customTags map.
      customTags.addEntries([
        MapEntry(
          descendantElement.name.toString(),
          descendantElement.innerText,
        ),
      ]);
    });

    return CustomNamespace(customTags: customTags);
  }
}
