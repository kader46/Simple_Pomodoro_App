import 'package:flutter/material.dart';
import 'package:pomodorotimer/utils/constants.dart';

class DoroWidget extends StatelessWidget {
  DoroWidget({this.greetMsg, this.taskMsg, this.assetImage, this.onClick});

  final String greetMsg;
  final String taskMsg;
  final Function onClick;
  final AssetImage assetImage;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Image(
        image: assetImage,
        height: 150.0,
        width: 150.0,
      ),
      onPressed: onClick,
    );
  }
}
