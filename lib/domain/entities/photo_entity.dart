import 'dart:convert';

import 'package:equatable/equatable.dart';

List<PhotoEntity> photoEntityFromJson(String str) => List<PhotoEntity>.from(
    json.decode(str).map((x) => PhotoEntity.fromJson(x)));

String photoEntityToJson(List<PhotoEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhotoEntity extends Equatable {
  final String id;
  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime promotedAt;
  final int width;
  final int height;
  final String color;
  final String blurHash;
  final dynamic description;
  final dynamic altDescription;
  final List<dynamic> breadcrumbs;
  final Urls urls;
  final PhotoEntityLinks links;
  final int likes;
  final bool likedByUser;
  final List<dynamic> currentUserCollections;
  final dynamic sponsorship;
  final TopicSubmissions topicSubmissions;
  final User user;
  final Exif exif;
  final Location location;
  final int views;
  final int downloads;

  const PhotoEntity({
    required this.id,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.promotedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.blurHash,
    required this.description,
    required this.altDescription,
    required this.breadcrumbs,
    required this.urls,
    required this.links,
    required this.likes,
    required this.likedByUser,
    required this.currentUserCollections,
    required this.sponsorship,
    required this.topicSubmissions,
    required this.user,
    required this.exif,
    required this.location,
    required this.views,
    required this.downloads,
  });

  PhotoEntity copyWith({
    String? id,
    String? slug,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? promotedAt,
    int? width,
    int? height,
    String? color,
    String? blurHash,
    dynamic description,
    dynamic altDescription,
    List<dynamic>? breadcrumbs,
    Urls? urls,
    PhotoEntityLinks? links,
    int? likes,
    bool? likedByUser,
    List<dynamic>? currentUserCollections,
    dynamic sponsorship,
    TopicSubmissions? topicSubmissions,
    User? user,
    Exif? exif,
    Location? location,
    int? views,
    int? downloads,
  }) =>
      PhotoEntity(
        id: id ?? this.id,
        slug: slug ?? this.slug,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        promotedAt: promotedAt ?? this.promotedAt,
        width: width ?? this.width,
        height: height ?? this.height,
        color: color ?? this.color,
        blurHash: blurHash ?? this.blurHash,
        description: description ?? this.description,
        altDescription: altDescription ?? this.altDescription,
        breadcrumbs: breadcrumbs ?? this.breadcrumbs,
        urls: urls ?? this.urls,
        links: links ?? this.links,
        likes: likes ?? this.likes,
        likedByUser: likedByUser ?? this.likedByUser,
        currentUserCollections:
            currentUserCollections ?? this.currentUserCollections,
        sponsorship: sponsorship ?? this.sponsorship,
        topicSubmissions: topicSubmissions ?? this.topicSubmissions,
        user: user ?? this.user,
        exif: exif ?? this.exif,
        location: location ?? this.location,
        views: views ?? this.views,
        downloads: downloads ?? this.downloads,
      );

  factory PhotoEntity.fromJson(Map<String, dynamic> json) => PhotoEntity(
        id: json["id"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        promotedAt: DateTime.parse(json["promoted_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        blurHash: json["blur_hash"],
        description: json["description"],
        altDescription: json["alt_description"],
        breadcrumbs: List<dynamic>.from(json["breadcrumbs"].map((x) => x)),
        urls: Urls.fromJson(json["urls"]),
        links: PhotoEntityLinks.fromJson(json["links"]),
        likes: json["likes"],
        likedByUser: json["liked_by_user"],
        currentUserCollections:
            List<dynamic>.from(json["current_user_collections"].map((x) => x)),
        sponsorship: json["sponsorship"],
        topicSubmissions: TopicSubmissions.fromJson(json["topic_submissions"]),
        user: User.fromJson(json["user"]),
        exif: Exif.fromJson(json["exif"]),
        location: Location.fromJson(json["location"]),
        views: json["views"],
        downloads: json["downloads"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "promoted_at": promotedAt.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "blur_hash": blurHash,
        "description": description,
        "alt_description": altDescription,
        "breadcrumbs": List<dynamic>.from(breadcrumbs.map((x) => x)),
        "urls": urls.toJson(),
        "links": links.toJson(),
        "likes": likes,
        "liked_by_user": likedByUser,
        "current_user_collections":
            List<dynamic>.from(currentUserCollections.map((x) => x)),
        "sponsorship": sponsorship,
        "topic_submissions": topicSubmissions.toJson(),
        "user": user.toJson(),
        "exif": exif.toJson(),
        "location": location.toJson(),
        "views": views,
        "downloads": downloads,
      };

  @override
  List<Object?> get props => [
        id,
        slug,
        createdAt,
        updatedAt,
        promotedAt,
        width,
        height,
        color,
        blurHash,
        description,
        altDescription,
        breadcrumbs,
        urls,
        links,
        likes,
        likedByUser,
        currentUserCollections,
        sponsorship,
        topicSubmissions,
        user,
        exif,
        location,
        views,
        downloads
      ];
}

class Exif {
  final dynamic make;
  final dynamic model;
  final dynamic name;
  final dynamic exposureTime;
  final dynamic aperture;
  final dynamic focalLength;
  final dynamic iso;

  Exif({
    required this.make,
    required this.model,
    required this.name,
    required this.exposureTime,
    required this.aperture,
    required this.focalLength,
    required this.iso,
  });

  Exif copyWith({
    dynamic make,
    dynamic model,
    dynamic name,
    dynamic exposureTime,
    dynamic aperture,
    dynamic focalLength,
    int? iso,
  }) =>
      Exif(
        make: make ?? this.make,
        model: model ?? this.model,
        name: name ?? this.name,
        exposureTime: exposureTime ?? this.exposureTime,
        aperture: aperture ?? this.aperture,
        focalLength: focalLength ?? this.focalLength,
        iso: iso ?? this.iso,
      );

  factory Exif.fromJson(Map<String, dynamic> json) => Exif(
        make: json["make"],
        model: json["model"],
        name: json["name"],
        exposureTime: json["exposure_time"],
        aperture: json["aperture"],
        focalLength: json["focal_length"],
        iso: json["iso"],
      );

  Map<String, dynamic> toJson() => {
        "make": make,
        "model": model,
        "name": name,
        "exposure_time": exposureTime,
        "aperture": aperture,
        "focal_length": focalLength,
        "iso": iso,
      };
}

class PhotoEntityLinks {
  final String self;
  final String html;
  final String download;
  final String downloadLocation;

  PhotoEntityLinks({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  PhotoEntityLinks copyWith({
    String? self,
    String? html,
    String? download,
    String? downloadLocation,
  }) =>
      PhotoEntityLinks(
        self: self ?? this.self,
        html: html ?? this.html,
        download: download ?? this.download,
        downloadLocation: downloadLocation ?? this.downloadLocation,
      );

  factory PhotoEntityLinks.fromJson(Map<String, dynamic> json) =>
      PhotoEntityLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
      };
}

class Location {
  final String? name;
  final String? city;
  final String? country;
  final Position position;

  Location({
    required this.name,
    required this.city,
    required this.country,
    required this.position,
  });

  Location copyWith({
    String? name,
    String? city,
    String? country,
    Position? position,
  }) =>
      Location(
        name: name ?? this.name,
        city: city ?? this.city,
        country: country ?? this.country,
        position: position ?? this.position,
      );

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        city: json["city"],
        country: json["country"],
        position: Position.fromJson(json["position"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "city": city,
        "country": country,
        "position": position.toJson(),
      };
}

class Position {
  final dynamic latitude;
  final dynamic longitude;

  Position({
    required this.latitude,
    required this.longitude,
  });

  Position copyWith({
    dynamic latitude,
    dynamic longitude,
  }) =>
      Position(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class TopicSubmissions {
  final Wallpapers? wallpapers;

  TopicSubmissions({
    this.wallpapers,
  });

  TopicSubmissions copyWith({
    Wallpapers? wallpapers,
  }) =>
      TopicSubmissions(
        wallpapers: wallpapers ?? this.wallpapers,
      );

  factory TopicSubmissions.fromJson(Map<String, dynamic> json) =>
      TopicSubmissions(
        wallpapers: json["wallpapers"] == null
            ? null
            : Wallpapers.fromJson(json["wallpapers"]),
      );

  Map<String, dynamic> toJson() => {
        "wallpapers": wallpapers?.toJson(),
      };
}

class Wallpapers {
  final String status;
  final dynamic approvedOn;

  Wallpapers({
    required this.status,
    required this.approvedOn,
  });

  Wallpapers copyWith({
    String? status,
    dynamic approvedOn,
  }) =>
      Wallpapers(
        status: status ?? this.status,
        approvedOn: approvedOn ?? this.approvedOn,
      );

  factory Wallpapers.fromJson(Map<String, dynamic> json) => Wallpapers(
        status: json["status"],
        approvedOn: json["approved_on"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "approved_on": approvedOn.toIso8601String(),
      };
}

class Urls {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;
  final String smallS3;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  Urls copyWith({
    String? raw,
    String? full,
    String? regular,
    String? small,
    String? thumb,
    String? smallS3,
  }) =>
      Urls(
        raw: raw ?? this.raw,
        full: full ?? this.full,
        regular: regular ?? this.regular,
        small: small ?? this.small,
        thumb: thumb ?? this.thumb,
        smallS3: smallS3 ?? this.smallS3,
      );

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
      };
}

class User {
  final String id;
  final DateTime updatedAt;
  final String username;
  final String name;
  final String firstName;
  final dynamic lastName;
  final String? twitterUsername;
  final String? portfolioUrl;
  final String? bio;
  final dynamic location;
  final UserLinks links;
  final ProfileImage profileImage;
  final dynamic instagramUsername;
  final int totalCollections;
  final int totalLikes;
  final int totalPhotos;
  final int totalPromotedPhotos;
  final bool acceptedTos;
  final bool forHire;
  final Social social;

  User({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.twitterUsername,
    required this.portfolioUrl,
    required this.bio,
    required this.location,
    required this.links,
    required this.profileImage,
    required this.instagramUsername,
    required this.totalCollections,
    required this.totalLikes,
    required this.totalPhotos,
    required this.totalPromotedPhotos,
    required this.acceptedTos,
    required this.forHire,
    required this.social,
  });

  User copyWith({
    String? id,
    DateTime? updatedAt,
    String? username,
    String? name,
    String? firstName,
    dynamic lastName,
    String? twitterUsername,
    String? portfolioUrl,
    String? bio,
    dynamic location,
    UserLinks? links,
    ProfileImage? profileImage,
    dynamic instagramUsername,
    int? totalCollections,
    int? totalLikes,
    int? totalPhotos,
    int? totalPromotedPhotos,
    bool? acceptedTos,
    bool? forHire,
    Social? social,
  }) =>
      User(
        id: id ?? this.id,
        updatedAt: updatedAt ?? this.updatedAt,
        username: username ?? this.username,
        name: name ?? this.name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        twitterUsername: twitterUsername ?? this.twitterUsername,
        portfolioUrl: portfolioUrl ?? this.portfolioUrl,
        bio: bio ?? this.bio,
        location: location ?? this.location,
        links: links ?? this.links,
        profileImage: profileImage ?? this.profileImage,
        instagramUsername: instagramUsername ?? this.instagramUsername,
        totalCollections: totalCollections ?? this.totalCollections,
        totalLikes: totalLikes ?? this.totalLikes,
        totalPhotos: totalPhotos ?? this.totalPhotos,
        totalPromotedPhotos: totalPromotedPhotos ?? this.totalPromotedPhotos,
        acceptedTos: acceptedTos ?? this.acceptedTos,
        forHire: forHire ?? this.forHire,
        social: social ?? this.social,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        twitterUsername: json["twitter_username"],
        portfolioUrl: json["portfolio_url"],
        bio: json["bio"],
        location: json["location"],
        links: UserLinks.fromJson(json["links"]),
        profileImage: ProfileImage.fromJson(json["profile_image"]),
        instagramUsername: json["instagram_username"],
        totalCollections: json["total_collections"],
        totalLikes: json["total_likes"],
        totalPhotos: json["total_photos"],
        totalPromotedPhotos: json["total_promoted_photos"],
        acceptedTos: json["accepted_tos"],
        forHire: json["for_hire"],
        social: Social.fromJson(json["social"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "twitter_username": twitterUsername,
        "portfolio_url": portfolioUrl,
        "bio": bio,
        "location": location,
        "links": links.toJson(),
        "profile_image": profileImage.toJson(),
        "instagram_username": instagramUsername,
        "total_collections": totalCollections,
        "total_likes": totalLikes,
        "total_photos": totalPhotos,
        "total_promoted_photos": totalPromotedPhotos,
        "accepted_tos": acceptedTos,
        "for_hire": forHire,
        "social": social.toJson(),
      };
}

class UserLinks {
  final String self;
  final String html;
  final String photos;
  final String likes;
  final String portfolio;
  final String following;
  final String followers;

  UserLinks({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
    required this.portfolio,
    required this.following,
    required this.followers,
  });

  UserLinks copyWith({
    String? self,
    String? html,
    String? photos,
    String? likes,
    String? portfolio,
    String? following,
    String? followers,
  }) =>
      UserLinks(
        self: self ?? this.self,
        html: html ?? this.html,
        photos: photos ?? this.photos,
        likes: likes ?? this.likes,
        portfolio: portfolio ?? this.portfolio,
        following: following ?? this.following,
        followers: followers ?? this.followers,
      );

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
      };
}

class ProfileImage {
  final String small;
  final String medium;
  final String large;

  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  ProfileImage copyWith({
    String? small,
    String? medium,
    String? large,
  }) =>
      ProfileImage(
        small: small ?? this.small,
        medium: medium ?? this.medium,
        large: large ?? this.large,
      );

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
      };
}

class Social {
  final dynamic instagramUsername;
  final String? portfolioUrl;
  final String? twitterUsername;
  final dynamic paypalEmail;

  Social({
    required this.instagramUsername,
    required this.portfolioUrl,
    required this.twitterUsername,
    required this.paypalEmail,
  });

  Social copyWith({
    dynamic instagramUsername,
    String? portfolioUrl,
    String? twitterUsername,
    dynamic paypalEmail,
  }) =>
      Social(
        instagramUsername: instagramUsername ?? this.instagramUsername,
        portfolioUrl: portfolioUrl ?? this.portfolioUrl,
        twitterUsername: twitterUsername ?? this.twitterUsername,
        paypalEmail: paypalEmail ?? this.paypalEmail,
      );

  factory Social.fromJson(Map<String, dynamic> json) => Social(
        instagramUsername: json["instagram_username"],
        portfolioUrl: json["portfolio_url"],
        twitterUsername: json["twitter_username"],
        paypalEmail: json["paypal_email"],
      );

  Map<String, dynamic> toJson() => {
        "instagram_username": instagramUsername,
        "portfolio_url": portfolioUrl,
        "twitter_username": twitterUsername,
        "paypal_email": paypalEmail,
      };
}
