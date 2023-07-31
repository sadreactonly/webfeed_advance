import 'package:webfeed_advance/domain/custom_namespace/custom.dart';
import 'package:webfeed_advance/domain/dublin_core/dublin_core.dart';
import 'package:webfeed_advance/domain/itunes/itunes.dart';
import 'package:webfeed_advance/domain/media/media.dart';
import 'package:webfeed_advance/domain/podcast/podcast_item.dart';
import 'package:webfeed_advance/domain/rss/rss_category.dart';
import 'package:webfeed_advance/domain/rss/rss_content.dart';
import 'package:webfeed_advance/domain/rss/rss_enclosure.dart';
import 'package:webfeed_advance/domain/rss/rss_source.dart';
import 'package:webfeed_advance/util/datetime.dart';
import 'package:webfeed_advance/util/iterable.dart';
import 'package:xml/xml.dart';

/// Represents an item within an RSS feed.
class RssItem {
  final String? title;
  final String? description;
  final String? link;

  final List<RssCategory>? categories;
  final String? guid;
  final DateTime? pubDate;
  final String? author;
  final String? comments;
  final RssSource? source;
  final RssContent? content;
  final Media? media;
  final RssEnclosure? enclosure;
  final DublinCore? dc;
  final Itunes? itunes;
  final PodcastItem? podcast;
  final CustomNamespace? customNamespace;

  /// Constructor for the `RssItem` class.
  ///
  /// Initialize the RSS item properties such as [title], [description], [link], [categories], [guid], [pubDate],
  /// [author], [comments], [source], [content], [media], [enclosure], [dc], [itunes], [podcast], and [customNamespace].
  RssItem({
    this.title,
    this.description,
    this.link,
    this.categories,
    this.guid,
    this.pubDate,
    this.author,
    this.comments,
    this.source,
    this.content,
    this.media,
    this.enclosure,
    this.dc,
    this.itunes,
    this.podcast,
    this.customNamespace,
  });

  /// Factory method to create an `RssItem` object from an [XmlElement].
  ///
  /// This method parses the [element] and extracts the relevant information from it
  /// to create an `RssItem` object and returns it.
  ///
  /// The extracted information includes the title, description, link, categories, GUID, publication date,
  /// author, comments, source, content, media, enclosure, Dublin Core metadata, iTunes metadata, podcast metadata,
  /// and custom namespace metadata.
  factory RssItem.parse(XmlElement element) {
    return RssItem(
      title: element.findElements('title').firstOrNull?.innerText,
      description: element.findElements('description').firstOrNull?.innerText,
      link: element.findElements('link').firstOrNull?.innerText,
      categories: element
          .findElements('category')
          .map((e) => RssCategory.parse(e))
          .toList(),
      guid: element.findElements('guid').firstOrNull?.innerText,
      pubDate:
          parseDateTime(element.findElements('pubDate').firstOrNull?.innerText),
      author: element.findElements('author').firstOrNull?.innerText,
      comments: element.findElements('comments').firstOrNull?.innerText,
      source: element
          .findElements('source')
          .map((e) => RssSource.parse(e))
          .firstOrNull,
      content: element
          .findElements('content:encoded')
          .map((e) => RssContent.parse(e))
          .firstOrNull,
      media: Media.parse(element),
      enclosure: element
          .findElements('enclosure')
          .map((e) => RssEnclosure.parse(e))
          .firstOrNull,
      dc: DublinCore.parse(element),
      itunes: Itunes.parse(element),
      podcast: PodcastItem.parse(element),
      customNamespace: CustomNamespace.parse(element),
    );
  }
}
