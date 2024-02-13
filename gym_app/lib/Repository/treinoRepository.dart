import 'package:cloud_firestore/cloud_firestore.dart';

class TreinoRepository {
  var db = FirebaseFirestore.instance.collection('treino');

  extrairDados() {
    db.get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          String descricao = docSnapshot.get('descricao');
          List<String> lista = [];
          lista.add(descricao);
          return lista;
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }
}
