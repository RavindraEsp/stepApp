import 'package:flutter/cupertino.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:step_app/helper/common_method.dart';

class HomeScreenProvider extends ChangeNotifier {
  var value = 0;

  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String status = '?', steps = '?';

  bool isGetInitialValue = false;
  int pedometerInitialValue = 0;

  ////////

  Timer? apiTimer;

  bool shouldCallApiFunction = true;

  HomeScreenProvider() {
    print("Provider init called");
  }

  updateV() {
    value = 12;

    print("value $value");
  }

  getV() {
    print("value $value");
  }

  addTimerForApiCall() {
    apiTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      // Call your function here
      print('Function called at ${DateTime.now()}');
      CommonMethod.showSuccessToast(msg: "Api Called");
    });
  }

  void onStepCount(StepCount event) {
    print(event);
    // setState(() {
    if (isGetInitialValue == false) {
      pedometerInitialValue = event.steps;
      isGetInitialValue = true;
    }
    //   _steps = event.steps.toString();

    var calculatedStep = event.steps - pedometerInitialValue;
    steps = calculatedStep.toString();
    //   });

    notifyListeners();
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    // setState(() {
    status = event.status;
    //  });

    notifyListeners();
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    // setState(() {
    status = 'Pedestrian Status not available';
    //  });
    print(status);
    notifyListeners();
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    //  setState(() {
    steps = 'Step Count not available';
    notifyListeners();
    //  });
  }

  Future<void> checkPermission() async {
    // PermissionStatus status = await Permission.activityRecognition.status;
    PermissionStatus status = await Permission.activityRecognition.request();

    if (status.isGranted) {
      // Permission is already granted, proceed with using the pedometer

      initPlatformState();
    } else {
      // Permission is not granted, request it
    }
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    //  if (!mounted) return;
  }
}
