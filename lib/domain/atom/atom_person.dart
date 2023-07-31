import 'package:webfeed_advanced/util/iterable.dart';
import 'package:xml/xml.dart';

/// Represents a person in the Atom feed.
///
/// The `AtomPerson` class corresponds to the "author" and "contributor" elements in the Atom feed.
class AtomPerson {
  /// The name of the person.
  final String? name;

  /// The URI of the person.
  final String? uri;

  /// The email address of the person.
  final String? email;

  /// Constructor for creating an [AtomPerson] object.
  ///
  /// The constructor initializes an [AtomPerson] object with the following named parameters:
  /// - [name]: The name of the person.
  /// - [uri]: The URI of the person.
  /// - [email]: The email address of the person.
  AtomPerson({this.name, this.uri, this.email});

  /// Factory method to parse an [XmlElement] and create an [AtomPerson] object from it.
  ///
  /// The [element] is an XML element containing the person information.
  ///
  /// Returns the parsed [AtomPerson] object.
  factory AtomPerson.parse(XmlElement element) {
    return AtomPerson(
      name: element.findElements('name').firstOrNull?.innerText,
      uri: element.findElements('uri').firstOrNull?.innerText,
      email: element.findElements('email').firstOrNull?.innerText,
    );
  }
}
