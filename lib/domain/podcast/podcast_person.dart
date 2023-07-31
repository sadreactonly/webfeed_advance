import 'package:xml/xml.dart';

/// Represents a person with role, group, img, href, and value attributes.
///
/// The `Person` class corresponds to the `person` element in the podcast namespace.
class Person {
  /// The role attribute value of the person.
  final String? role;

  /// The group attribute value of the person.
  final String? group;

  /// The img attribute value of the person.
  final String? img;

  /// The href attribute value of the person.
  final String? href;

  /// The value of the person.
  final String? value;

  /// Constructor for creating a [Person] object.
  ///
  /// The constructor initializes a [Person] object with optional named parameters:
  /// - [role]: The role attribute value of the person.
  /// - [group]: The group attribute value of the person.
  /// - [img]: The img attribute value of the person.
  /// - [href]: The href attribute value of the person.
  /// - [value]: The value of the person.
  Person({
    this.role,
    this.group,
    this.img,
    this.href,
    this.value,
  });

  /// Factory method to parse an [XmlElement] and create a [Person] object from it.
  ///
  /// The [element] is an XML element containing the person information.
  ///
  /// Returns the parsed [Person] object.
  factory Person.parse(XmlElement element) {
    return Person(
      role: element.getAttribute('role'),
      group: element.getAttribute('group'),
      img: element.getAttribute('img'),
      href: element.getAttribute('href'),
      value: element.innerText,
    );
  }
}
