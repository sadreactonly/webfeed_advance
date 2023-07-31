import 'package:webfeed_advance/util/iterable.dart';
import 'package:xml/xml.dart';

class AtomPerson {
  final String? name;
  final String? uri;
  final String? email;

  AtomPerson({this.name, this.uri, this.email});

  factory AtomPerson.parse(XmlElement element) {
    return AtomPerson(
      name: element.findElements('name').firstOrNull?.innerText,
      uri: element.findElements('uri').firstOrNull?.innerText,
      email: element.findElements('email').firstOrNull?.innerText,
    );
  }
}
