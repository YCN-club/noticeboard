// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

Posts postsFromJson(String str) => Posts.fromJson(json.decode(str));

String postsToJson(Posts data) => json.encode(data.toJson());

class Posts {
    Posts({
        required this.ms,
        required this.query,
        required this.result,
    });

    int ms;
    String query;
    List<Result> result;

    factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        ms: json["ms"],
        query: json["query"],
        result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ms": ms,
        "query": query,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
    };
}

class Result {
    Result({
        required this.imageUrl,
        required this.published,
        required this.createdAt,
        required this.id,
        required this.rev,
        required this.type,
        required this.updatedAt,
        required this.date,
        required this.endTime,
        required this.longDescription,
        required this.mainImage,
        required this.order,
        required this.publishedAt,
        required this.redirect,
        required this.shortDescription,
        required this.startTime,
        required this.tags,
        required this.title,
    });

    String imageUrl;
    bool published;
    DateTime createdAt;
    String id;
    String rev;
    String type;
    DateTime updatedAt;
    DateTime date;
    DateTime endTime;
    String longDescription;
    MainImage mainImage;
    int order;
    DateTime publishedAt;
    String redirect;
    String shortDescription;
    DateTime startTime;
    List<String> tags;
    String title;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        imageUrl: json["ImageUrl"],
        published: json["Published"],
        createdAt: DateTime.parse(json["_createdAt"]),
        id: json["_id"],
        rev: json["_rev"],
        type: json["_type"],
        updatedAt: DateTime.parse(json["_updatedAt"]),
        date: DateTime.parse(json["date"]),
        endTime: DateTime.parse(json["endTime"]),
        longDescription: json["longDescription"],
        mainImage: MainImage.fromJson(json["mainImage"]),
        order: json["order"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        redirect: json["redirect"],
        shortDescription: json["shortDescription"],
        startTime: DateTime.parse(json["startTime"]),
        tags: List<String>.from(json["tags"].map((x) => x)),
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "ImageUrl": imageUrl,
        "Published": published,
        "_createdAt": createdAt.toIso8601String(),
        "_id": id,
        "_rev": rev,
        "_type": type,
        "_updatedAt": updatedAt.toIso8601String(),
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "endTime": endTime.toIso8601String(),
        "longDescription": longDescription,
        "mainImage": mainImage.toJson(),
        "order": order,
        "publishedAt": publishedAt.toIso8601String(),
        "redirect": redirect,
        "shortDescription": shortDescription,
        "startTime": startTime.toIso8601String(),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "title": title,
    };
}

class MainImage {
    MainImage({
        required this.type,
        required this.asset,
    });

    String type;
    Asset asset;

    factory MainImage.fromJson(Map<String, dynamic> json) => MainImage(
        type: json["_type"],
        asset: Asset.fromJson(json["asset"]),
    );

    Map<String, dynamic> toJson() => {
        "_type": type,
        "asset": asset.toJson(),
    };
}

class Asset {
    Asset({
        required this.ref,
        required this.type,
    });

    String ref;
    String type;

    factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        ref: json["_ref"],
        type: json["_type"],
    );

    Map<String, dynamic> toJson() => {
        "_ref": ref,
        "_type": type,
    };
}
