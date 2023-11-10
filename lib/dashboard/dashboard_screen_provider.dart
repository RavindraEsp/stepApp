// import 'package:flutter/cupertino.dart';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:pedometer/pedometer.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:step_app/helper/common_method.dart';
//
// class DashBoardScreenProvider extends ChangeNotifier {
//   var value = 0;
//
//   late Stream<StepCount> _stepCountStream;
//   late Stream<PedestrianStatus> _pedestrianStatusStream;
//   String status = '?', steps = '0';
//
//   bool isGetInitialValue = false;
//   int pedometerInitialValue = 0;
//
//   bool isWalking = false;
//
//   ////////
//
//   Timer? apiTimer;
//
//   bool shouldCallApiFunction = true;
//
//   DashBoardScreenProvider() {
//     print("Provider init called");
//   }
//
//   dashboardApiCAll() {
//     if (isWalking == false) {
//       CommonMethod.showSuccessToast(msg: "Dashboard Api Called");
//     }
//   }
//
//   updateV() {
//     value = 12;
//
//     print("value $value");
//   }
//
//   getV() {
//     print("value $value");
//   }
//
//   startApiCallAnAddTimerForSendDataApiCall() {
//     //start api success response
//     checkPermission();
//     // set walikimg
//     isWalking = true;
//     isGetInitialValue =
//         false; // for get default pedometer and stop condition value
//     apiTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
//       // Call your function here
//       print('Function called at ${DateTime.now()}');
//       CommonMethod.showSuccessToast(msg: "Api Called");
//     });
//   }
//
//   stopWalk() {
//     apiTimer?.cancel();
//     isWalking = false;
//     CommonMethod.showSuccessToast(msg: "Stop Api Called ad timer off");
//   }
//
//   void onStepCount(StepCount event) {
//     print(event);
//
//     if (isWalking == true) {
//       if (isGetInitialValue == false) {
//         //  pedometerInitialValue = event.steps;
//         pedometerInitialValue = event.steps - int.parse(steps);
//         isGetInitialValue = true;
//       }
//       //   _steps = event.steps.toString();
//       var calculatedStep = event.steps - pedometerInitialValue;
//       steps = calculatedStep.toString();
//       notifyListeners();
//       print("Initial value $pedometerInitialValue");
//     }
//     notifyListeners();
//   }
//
//   void onPedestrianStatusChanged(PedestrianStatus event) {
//     print(event);
//     status = event.status;
//     notifyListeners();
//   }
//
//   void onPedestrianStatusError(error) {
//     print('onPedestrianStatusError: $error');
//     status = 'Pedestrian Status not available';
//     print(status);
//     notifyListeners();
//   }
//
//   void onStepCountError(error) {
//     print('onStepCountError: $error');
//     steps = 'Step Count not available';
//     notifyListeners();
//   }
//
//   Future<void> checkPermission() async {
//     PermissionStatus status = await Permission.activityRecognition.request();
//
//     if (status.isGranted) {
//       // Permission is already granted, proceed with using the pedometer
//       initPlatformState();
//     } else {
//       // Permission is not granted, request it
//     }
//   }
//
//   void initPlatformState() {
//     _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
//     _pedestrianStatusStream
//         .listen(onPedestrianStatusChanged)
//         .onError(onPedestrianStatusError);
//     _stepCountStream = Pedometer.stepCountStream;
//     _stepCountStream.listen(onStepCount).onError(onStepCountError);
//
//     //  if (!mounted) return;
//   }
// }

import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:step_app/helper/common_method.dart';

class DashBoardScreenProvider extends ChangeNotifier {
  var value = 0;

  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String status = '?';

  int totalSteps = 0;
  int oldCompleteSteps = 0;
  int startStep = 0;
  int endStep = 0;

  bool isWalking = false;
  bool isGetInitialValue = false;

  // int pedometerInitialValue = 0;
  ////////

  Timer? apiTimer;

  bool shouldCallApiFunction = true;

  DashBoardScreenProvider() {
    print("Provider init called");
  }

  dashboardApiCAll() {
    if (isWalking == false) {
      CommonMethod.showSuccessToast(msg: "Dashboard Api Called");
    }
  }

  updateV() {
    value = 12;

    print("value $value");
  }

  getV() {
    print("value $value");
  }

  startApiCallAnAddTimerForSendDataApiCall() {
    //start api success response
    checkPermission();
    // set walikimg
    isWalking = true;
    isGetInitialValue =
        false; // for get default pedometer and stop condition value
    apiTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      // Call your function here
      print('Function called at ${DateTime.now()}');
      CommonMethod.showSuccessToast(msg: "Api Called");
    });
  }

  stopWalk() {
    apiTimer?.cancel();
    isWalking = false;

    oldCompleteSteps = totalSteps;
    CommonMethod.showSuccessToast(msg: "Stop Api Called ad timer off");
  }

  void onStepCount(StepCount event) {
    print(event);

    if (isWalking == true) {
      if (isGetInitialValue == false) {
        //  pedometerInitialValue = event.steps;
        //  pedometerInitialValue = event.steps - int.parse(totalSteps);
        startStep = event.steps;
        isGetInitialValue = true;
      }
      //   _steps = event.steps.toString();
      endStep = event.steps;

      int calculatedStep = endStep - startStep;

      totalSteps = oldCompleteSteps + calculatedStep;
      notifyListeners();
      print("start value $startStep");
      print("end value $endStep");
      print("calculatedStep $calculatedStep");
    }
    notifyListeners();
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    status = event.status;
    notifyListeners();
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    status = 'Pedestrian Status not available';
    print(status);
    notifyListeners();
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');


    notifyListeners();
  }

  Future<void> checkPermission() async {
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
