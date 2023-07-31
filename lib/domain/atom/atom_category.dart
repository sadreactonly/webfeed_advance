import 'package:xml/xml.dart';

/// Represents an Atom category.
///
/// The `AtomCategory` class represents a category in an Atom feed.
/// It contains attributes such as the term, scheme, and label of the category.
class AtomCategory {
  /// The term attribute of the category.
  final String? term;

  /// The scheme attribute of the category.
  final String? scheme;

  /// The label attribute of the category.
  final String? label;

  /// Constructor for creating an [AtomCategory] object.
  ///
  /// The constructor initializes an [AtomCategory] object with the following parameters:
  /// - [term]: The term attribute of the category.
  /// - [scheme]: The scheme attribute of the category.
  /// - [label]: The label attribute of the category.
  AtomCategory(this.term, this.scheme, this.label);

  /// Factory method to parse an [XmlElement] and create an [AtomCategory] object from it.
  ///
  /// The [element] is an XML element containing the Atom category information.
  ///
  /// Returns the parsed [AtomCategory] object.
  factory AtomCategory.parse(XmlElement element) {
    var term = element.getAttribute('term');
    var scheme = element.getAttribute('scheme');
    var label = element.getAttribute('label');
    return AtomCategory(term, scheme, label);
  }
}
