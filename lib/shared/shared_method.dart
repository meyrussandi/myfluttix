part of 'shared.dart';

Future<File> getImage() async {
  var image = await ImagePicker().getImage(source: ImageSource.gallery);
  return File(image.path);
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  Reference reference = FirebaseStorage.instance.ref().child(fileName);
  UploadTask task = reference.putFile(image);
  return await (await task).ref.getDownloadURL();
}

Widget generateDashedDivider(double width) {
  int n = width ~/ 5;
  return Row(
    children: List.generate(
        n,
        (index) => (index % 2 == 0)
            ? Container(
                height: 2,
                width: width / n,
                color: Colors.white,
              )
            : SizedBox(
                width: width / n,
              )),
  );
}
