import 'package:xml/xml.dart';

// https://github.com/Podcastindex-org/podcast-namespace/blob/main/docs/1.0.md#source
class Source {
  final String? uri;
  final String? contentType;

  Source({
    this.uri,
    this.contentType,
  });

  factory Source.parse(XmlElement element) {
    return Source(
      uri: element.getAttribute('uri'),
      contentType: element.getAttribute('contentType'),
    );
  }
}
