import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conecta_arte/domain/entities/entities.dart';
import 'package:conecta_arte/helpers/helpers.dart';
import 'package:get/get.dart';

class HometabController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<ProfessionalEntity> professionalslist;

  final String photo = ''
      'https://scontent.fcgh10-1.fna.fbcdn.net/v/t1.0-9/102408756_1626381274177556_4459351393717263326_n.jpg?_nc_cat=104&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeFbs936K8VTG3zPJmmJYOdFF_LqzAwBu48X8urMDAG7jxah6Y4FYHQpL8Q9vQUm7n34JHhRoyOrdb4I3gnePzEh&_nc_ohc=eP8cDvhJvboAX_P4T1T&_nc_ht=scontent.fcgh10-1.fna&oh=f76fa04c99e237a6c41cb6bd982844ec&oe=5FE09793';
  final String photo2 =
      'https://scontent.fcgh10-1.fna.fbcdn.net/v/t1.0-9/125499333_1362255334116201_7579005930993712212_o.jpg?_nc_cat=107&ccb=2&_nc_sid=09cbfe&_nc_eui2=AeGEUTbT3Rg4nb6DCUQpJjax0-FfbWfWZxrT4V9tZ9ZnGiSXzxrv9KfH-byMkdy3r364DHwM6G0EubNVviqrPkWZ&_nc_ohc=WuV5XU9ve-4AX9JuI1p&_nc_ht=scontent.fcgh10-1.fna&oh=94f0e75606e2609822e28c5594005176&oe=5FDEE834';

  Future<void> getData() async {
    professionalslist = [];
    final QuerySnapshot mainsQuery = await firestore
        .collection(professionals)
        .doc(tecnology)
        .collection(mains)
        .get();
    final QuerySnapshot mainsQuery2 = await firestore
        .collection(professionals)
        .doc(painter)
        .collection(mains)
        .get();
    for (final main in mainsQuery.docs) {
      professionalslist.add(ProfessionalEntity.fromMap(main.data()));
    }
    for (final main in mainsQuery2.docs) {
      professionalslist.add(ProfessionalEntity.fromMap(main.data()));
    }
    update();
  }

  Future<void> setFakesData() async {
    final ProfessionalEntity professionalEntity = ProfessionalEntity(
      name: 'Victor Hugo',
      email: 'victorhspb18@gmail.com',
      phone: '(11) 97726-1437',
      adress: Adress(
        zipcode: '03967-010',
        place: 'Av. Manuel Velho Moreira',
        city: 'São Paulo',
        state: 'São Paulo',
        neighborhood: 'Jardim Colonial',
      ),
      category: tecnology,
      photo: photo2,
    );

    final ProfessionalEntity professionalEntity2 = ProfessionalEntity(
      name: 'Pedro Silva',
      email: 'pedrusilva@gmail.com',
      phone: '(11) 98159-4622',
      adress: Adress(
        zipcode: '00000-010',
        place: 'Teste',
        city: 'São Paulo',
        state: 'São Paulo',
        neighborhood: 'Jardim Colonial',
      ),
      category: painter,
      photo: photo,
    );
    firestore
        .collection(professionals)
        .doc(tecnology)
        .collection(mains)
        .doc()
        .set(
          professionalEntity.toMap(),
        );
    firestore
        .collection(professionals)
        .doc(painter)
        .collection(mains)
        .doc()
        .set(
          professionalEntity2.toMap(),
        );
  }

  @override
  Future<void> onInit() async {
    await setFakesData();
    getData();
    super.onInit();
  }
}
