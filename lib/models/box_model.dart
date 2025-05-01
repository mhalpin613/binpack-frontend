class BoxModel {
  final int width;
  final int height;
  int x;
  int y;

  BoxModel({required this.width, required this.height, this.x = 0, this.y = 0});

  factory BoxModel.fromJson(Map<String, dynamic> json) {
    return BoxModel(
      width: json['width'],
      height: json['height'],
      x: json['x'],
      y: json['y'],
    );
  }

  Map<String, dynamic> toRequestJson() => {'width': width, 'height': height};
}
