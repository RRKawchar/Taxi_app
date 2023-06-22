import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;

class FirebaseStorageController extends GetxController{
  uploadImage(File image) async {
    String imageUrl = '';
    String fileName = path.basename(image.path);
    var reference = FirebaseStorage.instance
        .ref()
        .child('users/$fileName');
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    await taskSnapshot.ref.getDownloadURL().then(
          (value) {
        imageUrl = value;
        print("Download URL: $value");
      },
    );

    return imageUrl;
  }
}