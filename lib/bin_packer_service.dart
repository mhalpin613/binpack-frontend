import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/box_model.dart';

Future<List<BoxModel>> fetchPackedBoxes(
  List<BoxModel> boxes,
  int containerWidth,
  int containerHeight,
) async {
  final url = Uri.parse(
    'https://binpack-api-mhalpin-aad0f8dsfpcffzd6.eastus-01.azurewebsites.net/api/binpack',
  );

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'containerWidth': containerWidth,
      'containerHeight': containerHeight,
      'boxes': boxes.map((b) => b.toRequestJson()).toList(),
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final List<dynamic> packed = data['packedBoxes'];
    return packed.map((b) => BoxModel.fromJson(b)).toList();
  } else {
    throw Exception('Failed to fetch packed boxes');
  }
}
