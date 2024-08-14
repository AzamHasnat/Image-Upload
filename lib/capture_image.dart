import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_upload_flutter/image_helper.dart';
import 'package:image_upload_flutter/utils.dart';

class CaptureImage extends StatefulWidget {
  const CaptureImage({super.key});

  @override
  State<CaptureImage> createState() => _CaptureImageState();
}

class _CaptureImageState extends State<CaptureImage> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Upload Image"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 64,
                backgroundImage: image !=null ? Image.file(image!).image : const NetworkImage("https://via.placeholder.com/150"),
                backgroundColor: Colors.grey,
              ),
              Positioned(
                bottom: -10,
                left: 80,
                child: IconButton(
                  onPressed: ()async{
                    image = await ImagePickerService().chooseImageFile(context);
          
                    image == null ?  ShowToast(message: "Image Not Picked") : setState((){});
                  },
                   icon: const Icon(Icons.add_a_photo))
                )
            ],
          ),
        ),
      ),
   /*  floatingActionButton: FloatingActionButton.extended(
      backgroundColor: Theme.of(context).buttonTheme.colorScheme?.background,
      //foregroundColor: Colors.blueGrey,
      onPressed: (){

      },
      label: Text("Upload"),
      hoverColor: Colors.orange,
      splashColor: Colors.blueGrey[500],
      elevation: 5,
      hoverElevation:  5,
      focusElevation: 5,
      highlightElevation: 5,
      
      ), */
      
    );
  }
}