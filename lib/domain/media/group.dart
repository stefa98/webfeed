import 'package:webfeed/domain/media/category.dart';
import 'package:webfeed/domain/media/content.dart';
import 'package:webfeed/domain/media/credit.dart';
import 'package:webfeed/domain/media/rating.dart';
import 'package:webfeed/domain/media/thumbnail.dart';
import 'package:webfeed/domain/media/title.dart';
import 'package:webfeed/domain/media/description.dart';
import 'package:webfeed/domain/media/community.dart';
import 'package:webfeed/util/iterable.dart';
import 'package:xml/xml.dart';

class Group {
  final Title? title;
  final List<Content>? contents;
  final List<Thumbnail>? thumbnails;
  final Description? description;
  final Community? community;
  final List<Credit>? credits;
  final Category? category;
  final Rating? rating;

  Group({
    this.title,
    this.contents,
    this.thumbnails,
    this.description,
    this.community,
    this.credits,
    this.category,
    this.rating,
  });

  static parse(XmlElement? element) {
    if (element == null) return null;
    return Group(
      title: element
          .findElements('media:title')
          .map((e) => Title.parse(e))
          .firstOrNull,
      contents: element.findElements('media:content').map((e) {
        return Content.parse(e);
      }).toList(),
      thumbnails: element.findElements('media:thumbnail').map((e) {
        return Thumbnail.parse(e);
      }).toList(),
      description: element
          .findElements('media:description')
          .map((e) => Description.parse(e))
          .firstOrNull,
      community: element
          .findElements('media:community')
          .map((e) => Community.parse(e))
          .firstOrNull,
      credits: element.findElements('media:credit').map((e) {
        return Credit.parse(e);
      }).toList(),
      category: element
          .findElements('media:category')
          .map((e) => Category.parse(e))
          .firstOrNull,
      rating: element
          .findElements('media:rating')
          .map((e) => Rating.parse(e))
          .firstOrNull,
    );
  }
}

