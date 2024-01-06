class Course {
  final String id;
  final String title;
  final String description;
  final String videoUrl;
  final String uploaderId;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.uploaderId,
  });

  toJson() {
    return {
      'id' : id,
      'title': title,
      'description' : description,
      'videoUrl' : videoUrl,
      'uploaderId' : uploaderId,
    };
  }
}
