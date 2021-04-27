part of 'services.dart';

class MyFluttixTransactionServices{
  static CollectionReference transactionCollection = FirebaseFirestore.instance.collection("transactions");

  static Future<void> saveTransaction(MyFluttixTransactionModel myFluttixTransactionModel)async{
    await transactionCollection.doc().set({
      'userID' : myFluttixTransactionModel.userID,
      'title' : myFluttixTransactionModel.title,
      'subtitle' : myFluttixTransactionModel.subTitle,
      'time' : myFluttixTransactionModel.time.millisecondsSinceEpoch,
      'amount' : myFluttixTransactionModel.amount,
      'picture' : myFluttixTransactionModel.picture
    });
  }

  static Future<List<MyFluttixTransactionModel>> getTransaction(String userID)async{
    QuerySnapshot snapshot = await transactionCollection.get();
    var documents = snapshot.docs.where((element)=>element.data()["userID"] == userID);

    return documents.map((e)=>
        MyFluttixTransactionModel(
          userID : e.data()["userID"],
          title : e.data()["title"],
          subTitle: e.data()['subtitle'],
          time : DateTime.fromMillisecondsSinceEpoch(e.data()['time']),
          amount : e.data()['amount'],
          picture : e.data()['picture']
        )
    ).toList();
  }
}