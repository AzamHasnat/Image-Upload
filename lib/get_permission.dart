import 'dart:html';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class GetPermisison{

  static Future<bool> getCamreaPermission() async {
    PermissionStatus permissionStatus = await Permission.camera.status;

    if(permissionStatus.isGranted){
      return true;
    }else if(permissionStatus.isDenied){
       PermissionStatus status = await Permission.camera.request();
       if(status.isGranted){
        return true;
       } else {
        ShowToast(message: "Permission Denied");
        return false; 
       }
    }
    return false;
  }


  static Future<bool> getStoragePermission() async {
    PermissionStatus permissionStatus = await Permission.storage.status;
    if(permissionStatus.isGranted){
      return true;
    }else if(permissionStatus.isDenied){
      PermissionStatus status = await Permission.storage.request();
        if(status.isGranted){
        return true;
       } else {
        //Utils.flutterToast("Permission Denied");
        ShowToast(message: "Permission Denied");
        return false; 
       }
    }
    return false;
  }

}

void ShowToast({required String message}){
  Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
}