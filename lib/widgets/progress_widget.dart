import 'dart:math';

import 'package:flutter/material.dart';

import '../theme/light_color.dart';
import '../theme/theme.dart';

class ProgressWidget extends StatefulWidget {
  final double totalValue;
  final double value;
  final Color activeColor;
  final Color backgroundColor;
  final String title;
  final durationTime;
  const ProgressWidget({
 required   Key key,
   required this.value,
    this.totalValue = 100,
  required  this.activeColor,
  required  this.backgroundColor,
   required this.title,
    this.durationTime,
  }) : super(key: key);

  @override
  _ProgressWidgetState createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget>
    with TickerProviderStateMixin {
  late double progress;
  late Color activeColor;
  late Color backgroundColor;
  @override
  void initState() {
    progress = (widget.value * 100) / widget.totalValue;
    progress = (progress / 100) * 360;
    activeColor = widget.activeColor;
    backgroundColor = widget.backgroundColor;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dimenstion = (AppTheme.fullWidth(context) - 10) * .3;
    activeColor ??= Theme.of(context).primaryColor;
    backgroundColor ??= Theme.of(context).disabledColor;
    const inCurve = ElasticOutCurve(0.38);
    return Container(
      height: dimenstion,
      width: dimenstion,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: progress),
                duration: Duration(milliseconds: widget.durationTime),
                builder: (context, value, child) {
                  // print(value);
                  return CustomPaint(
                    painter: ProgressPainter(
                      value,
                      activeColor,
                      backgroundColor,
                    ),
                  );
                },
              ),
              Text(
                "${widget.value}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 14, color: LightColor.grey),
          )
        ],
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double value;
  final Color activeColor;
  final Color backgroundColor;

  ProgressPainter(
    this.value,
    this.activeColor,
    this.backgroundColor,
  );
  @override
  void paint(Canvas canvas, Size size) async {
    var center1 = Offset(size.width / 2, size.height / 2);
    Paint active = Paint()
      ..color = activeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7;

    Paint inActive = Paint()
      ..color = backgroundColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    canvas.drawArc(
        Rect.fromCircle(center: center1, radius: 40), 0, 180, false, inActive);

    canvas.drawArc(Rect.fromCircle(center: center1, radius: 40), -90 * pi / 180,
        value * pi / 180, false, active);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class LinearPointCurve extends Curve {
  final double pIn;
  final double pOut;

  const LinearPointCurve(this.pIn, this.pOut);

  @override
  double transform(double x) {
    // Just a simple bit of linear interpolation math
    final lowerScale = pOut / pIn;
    final upperScale = (1.0 - pOut) / (1.0 - pIn);
    final upperOffset = 1.0 - upperScale;
    return x < pIn ? x * lowerScale : x * upperScale + upperOffset;
  }
}