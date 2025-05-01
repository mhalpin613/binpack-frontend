import 'package:flutter/material.dart';
import 'box_generator.dart';
import 'models/box_model.dart';
import 'box_painter.dart';
import 'bin_packer_service.dart';

void main() => runApp(const BinPackApp());

class BinPackApp extends StatelessWidget {
  const BinPackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BinPackHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BinPackHome extends StatefulWidget {
  const BinPackHome({super.key});

  @override
  State<BinPackHome> createState() => _BinPackHomeState();
}

class _BinPackHomeState extends State<BinPackHome> {
  List<BoxModel> _boxes = [];
  bool _isPacked = false;
  final int containerWidth = 512;
  final int containerHeight = 512;

  @override
  void initState() {
    super.initState();
    _boxes = generatePower2Boxes(containerWidth, containerHeight);
  }

  void _packBoxes() async {
    final packed = await fetchPackedBoxes(
      _boxes,
      containerWidth,
      containerHeight,
    );
    setState(() {
      _boxes = packed;
      _isPacked = true;
    });
  }

  void _reset() {
    setState(() {
      _boxes = generatePower2Boxes(containerWidth, containerHeight);
      _isPacked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: CustomPaint(
                size: Size(
                  containerWidth.toDouble(),
                  containerHeight.toDouble(),
                ),
                painter: BoxVisualizerPainter(
                  _boxes,
                  containerHeight.toDouble(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isPacked ? _reset : _packBoxes,
              child: Text(_isPacked ? 'Reset' : 'Pack Boxes'),
            ),
          ],
        ),
      ),
    );
  }
}
