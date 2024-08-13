import 'package:flutter/material.dart';

class CaptureImage extends StatefulWidget {
  const CaptureImage({super.key});

  @override
  State<CaptureImage> createState() => _CaptureImageState();
}

class _CaptureImageState extends State<CaptureImage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Upload Image"),
        centerTitle: true,
      ),
      body: Container(
        child: const Center(
          
        ),
    ),
    floatingActionButton: FloatingActionButton.extended(
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
      
      ),
      
    );
  }
}