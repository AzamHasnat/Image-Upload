import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_upload_flutter/get_permission.dart';

class ImagePickerService {

  Future<PickedFile> pickImage({required ImageSource source}) async{
    final xFileSource = await ImagePicker().pickImage(
      source: source
    );
    return PickedFile(xFileSource!.path);
  }

  Future<File?> chooseImageFile(BuildContext context) async{
    try{
      return await showModalBottomSheet(
        context: context, builder: (builder) => bottomSheet(context)
      );

    }catch(e){
      print(e);
    }
    return null;
  }


  Widget bottomSheet(BuildContext context){
   
    Future<void> openSource(ImageSource source) async{
      final file = await pickImage(source: source);

      File selected = File(file.path);
      if(await selected.exists()){
        Navigator.pop(context,selected);
      }else{
        Navigator.pop(context,File(''));
      }
    }
    var styleFs12Fw600 = const TextStyle(
    fontSize: 14,
    letterSpacing: 0.02,
    fontWeight: FontWeight.w600
  );

  return Container(
    height: 100,
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Column(
      children: [
        Text("Choose Image File",style: styleFs12Fw600,),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () async{
                final bool cameraStatus = await GetPermisison.getCamreaPermission();
                if(cameraStatus){
                  openSource(ImageSource.camera);
                }

              },
              child: Column(
                children: [
                  const Icon(Icons.image,size: 22,),
                  Text("Camera")
                ],
              ),
            ),
            const SizedBox(width: 1,),
            InkWell(
              onTap: () async{
                final bool galleryStatus = await GetPermisison.getStoragePermission();
                if(galleryStatus){
                  openSource(ImageSource.gallery);
                }

              },
              child: Column(
                children: [
                  const Icon(Icons.image,size: 22,),
                  Text("Gallery")
                ],
              ),
            )
          ],

        )
      ],
    ),
  );
  }
}
