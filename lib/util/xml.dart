import 'dart:core';

import 'package:webfeed_advance/util/iterable.dart';
import 'package:xml/xml.dart';

/// Finds XML elements with the specified [name] in a [node].
///
/// If [recursive] is true, it searches for the elements recursively in the XML tree,
/// otherwise, it only looks for direct children of the [node].
///
/// If [namespace] is provided, it searches for elements in the specified namespace.
/// Returns an iterable of XmlElement objects representing the found elements,
/// or null if no elements are found or an error occurs during the search.
Iterable<XmlElement>? findElements(
  XmlNode? node,
  String name, {
  bool recursive = false,
  String? namespace,
}) {
  try {
    if (recursive) {
      return node?.findAllElements(name, namespace: namespace);
    } else {
      return node?.findElements(name, namespace: namespace);
    }
  } on StateError {
    return null;
  }
}

/// Parses a boolean literal from an XML element with the specified [tagName].
///
/// It searches for the element with the given [tagName] and retrieves its inner text.
/// The inner text is then converted to lowercase and trimmed.
/// If the value is 'yes' or 'true', the function returns true, otherwise, it returns false.
/// If the element is not found or its value cannot be parsed as a boolean, it returns false.
bool parseBoolLiteral(XmlElement element, String tagName) {
  var v =
      element.findElements(tagName).firstOrNull?.innerText.toLowerCase().trim();
  if (v == null) return false;
  return ['yes', 'true'].contains(v);
}
