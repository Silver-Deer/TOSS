import 'package:flutter/material.dart';
import 'package:toss/components/loading_widget.dart';
import 'package:toss/utils/api_request_status.dart';

class BodyBuilder extends StatelessWidget {
  final APIRequestStatus apiRequestStatus;
  final Widget child;
  final Function reload;

  BodyBuilder(
      {Key? key,
      required this.apiRequestStatus,
      required this.child,
      required this.reload})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    switch (apiRequestStatus) {
      case APIRequestStatus.loaded:
        return child;

      case APIRequestStatus.connectionError:
      case APIRequestStatus.error:
        return Container();

      case APIRequestStatus.loading:
      case APIRequestStatus.unInitialized:
        return LoadingWidget();
    }
  }
}
