import 'package:xml/xml.dart';

class License {
  final String? type;
  final String? href;
  final String? value;
  final String? url;
  License({this.type, this.href, this.value, this.url});

  factory License.parse(XmlElement element) {
    return License(
      type: element.getAttribute('type'),
      href: element.getAttribute('href'),
      url: element.getAttribute('url'),
      value: element.innerText,
    );
  }
}
