import 'package:conecta_arte/domain/entities/professional/adress.dart';
import 'package:meta/meta.dart';

class ProfessionalEntity {
  String name;
  String email;
  String phone;
  Adress adress;
  String category;
  String photo;

  ProfessionalEntity({
    @required this.name,
    @required this.email,
    @required this.phone,
    @required this.adress,
    @required this.category,
    @required this.photo,
  });

  ProfessionalEntity.fromMap(Map<String, dynamic> map) {
    name = map['name'] as String;
    email = map['email'] as String;
    phone = map['phone'] as String;
    adress = Adress.fromMap(map['adress'] as Map<String, dynamic>);
    category = map['category'] as String;
    photo = map['photo'] as String;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'adress': adress.toMap(),
      'category': category,
      'photo': photo,
    };
  }

  @override
  String toString() {
    return 'name: $name, email $email, phone: $phone, adress: $adress, category: $category, photo: $photo';
  }
}
