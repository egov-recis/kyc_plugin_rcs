import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';

import 'landing_page_screen.dart';

class CameraScreen extends StatelessWidget {
  final void Function() onFinish;
  final String type;
  const CameraScreen({
    super.key,
    required this.type,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraAwesomeBuilder.awesome(
        saveConfig: SaveConfig.photo(
          mirrorFrontCamera: true,
        ),
        previewFit: CameraPreviewFit.contain,
        sensorConfig: SensorConfig.single(
          sensor: Sensor.position(
            type == "selfie" ? SensorPosition.front : SensorPosition.back,
          ),
        ),
        onMediaCaptureEvent: (mediaCapture) {
          {
            if (type == "selfie") {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LandingPageScreen(
                    onFinish: onFinish,
                    listStatus: [
                      3,
                      2,
                      1,
                    ],
                    nextPage: SizedBox(),
                    autoNextPage: false,
                  ),
                ),
              );
            } else {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LandingPageScreen(
                    onFinish: onFinish,
                    listStatus: [
                      3,
                      3,
                      2,
                    ],
                    nextPage: SizedBox(),
                    autoNextPage: false,
                    doFinish: true,
                  ),
                ),
              );
            }
          }
        },
        bottomActionsBuilder: (state) => AwesomeBottomActions(
          state: state,
          left: Container(),
        ),
      ),
    );
  }
}
