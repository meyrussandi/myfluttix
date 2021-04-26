part of 'shared.dart';

Future<File> getImage() async {
  var image = await ImagePicker().getImage(source: ImageSource.gallery);
  return File(image.path);
}


Future<String> uploadImage (File image)async{
  String fileName = basename(image.path);

  Reference reference = FirebaseStorage.instance.ref().child(fileName);
  UploadTask task = reference.putFile(image);
  return await (await task).ref.getDownloadURL();
}