import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  final bool isImage;

  LoadingWidget({this.isImage = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (isImage) {
      return SpinKitRipple(color: Theme.of(context).accentColor);
    } else {
      return SpinKitWave(color: Theme.of(context).accentColor);
    }
  }
}
