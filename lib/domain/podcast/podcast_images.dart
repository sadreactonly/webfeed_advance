import 'package:xml/xml.dart';

final exp = RegExp(r'([^ ]+) (\d)+w');

class Src {
  final String? url;
  final int? width;

  Src({required this.url, required this.width});
}

// https://github.com/Podcastindex-org/podcast-namespace/blob/main/docs/1.0.md#images
class Images {
  final List<Src> srcset;

  Images({
    required this.srcset,
  });

  factory Images.parse(XmlElement element) {
    final exp = RegExp(r'(\S+)\s+(\d+)w');
    var srcset = element.getAttribute('srcset');
    if (srcset != null) {
      return Images(
        srcset: srcset
            .split(',')
            .map((e) {
              final matches = exp.allMatches(e).toList();
              if (matches.isNotEmpty) {
                return Src(
                  url: matches[0].group(1).toString(),
                  width: int.tryParse(matches[0].group(2).toString()),
                );
              } else {
                return null;
              }
            })
            .whereType<Src>()
            .toList(),
      );
    } else {
      return Images(srcset: []);
    }
  }
}
