import 'dart:io';



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Upload extends StatefulWidget {

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  File? imageFile;

  final picker =ImagePicker();





  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        IconButton(
            onPressed: ()=>pickImageCamera(),
            icon: Icon(Icons.upload_rounded)
        ),
        // if(imageFile == null)
        // //   const Placeholder(
        // //     fallbackWidth: 1,
        // //     fallbackHeight: 2,
        // //     strokeWidth: 1,
        // //   )
        // // else
        //
        //  Image.file(imageFile!)
      ],
    );
        // icon: const Icon(Icons.upload_rounded,size: 20,color: Colors.grey,));
  }

  Future <void> pickImageCamera() async {

    final pickFile = await picker.pickImage(source : ImageSource.gallery);
    if(pickFile !=null){
      setState(() {
        imageFile =File(pickFile.path);
      });
    }

  }
}



