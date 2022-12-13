// ignore_for_file: non_constant_identifier_names

class GestUserModel {
  late int id;
  late String name;

  late String address;

  late String city;
  late String contact_phone;
  late String contact_email;

  GestUserModel(
      {required this.id,
      required this.name,
      required this.address,
      required this.city,
      required this.contact_phone,
      required this.contact_email});
}
