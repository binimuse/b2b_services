import 'dart:io';

import 'package:b2b_services/app/Services/graphql_conf.dart';
import 'package:b2b_services/app/config/theme/custom_colors.dart';
import 'package:b2b_services/app/constant/reusable_widget.dart';
import 'package:b2b_services/app/modules/my_profile/data/mutation/updateuser_mutuation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../data/model/getuser_model.dart';
import '../data/mutation/getuserid_mutuation.dart';

class MyProfileController extends GetxController {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  final GlobalKey<FormState> editprofilekey2 = GlobalKey<FormState>();
  late TextEditingController name, email, phone, address;
  var loadingUserID = false.obs;
  var loadingImage = false.obs;
  var updatepro = false.obs;
  var getUser = <GestUserModel>[].obs;
  final count = 0.obs;

  bool showPassword = false;
  ImagePicker picker = ImagePicker();

  List<XFile>? imageFileList;
  var profilepic = ''.obs;
  var selectedImagePath = ''.obs;
  set imageFile(XFile? value) {
    imageFileList = value == null ? null : [value];
    loadingImage(true);
  }

  var images = <File>[].obs;
  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      images.add(File(selectedImagePath.value));
    } else {
      Get.snackbar('Error', 'No Image Selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "Please provide fullname";
    }
    return null;
  }

  String? validateaddeaa(String value) {
    if (value.isEmpty) {
      return "Please provide Address";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      return "Please provide Phonenumber";
    }
    return null;
  }

  final reusableWidget = ReusableWidget();
  @override
  void onInit() {
    getUserId();
    name = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    address = TextEditingController();
    super.onInit();
  }

  void getUserId() async {
    UserIdMutation userIdMutation = UserIdMutation();
    GraphQLClient client = graphQLConfiguration.clientToQuery();

    QueryResult result = await client.query(
      QueryOptions(
        document: gql(userIdMutation.getMyUserId()),
      ),
    );

    if (!result.hasException) {
      loadingUserID(true);

      getUser.add(GestUserModel(
        id: int.parse(result.data!["auth"]["distributor"]["id"]),
        name: result.data!["auth"]["distributor"]["name"],
        address: result.data!["auth"]["distributor"]["address"],
        city: result.data!["auth"]["distributor"]["city"],
        contact_phone: result.data!["auth"]["distributor"]["contact_phone"],
        contact_email: result.data!["auth"]["distributor"]["contact_email"],
      ));

      print("idd ${getUser[0].id}");
    } else {
      loadingUserID(false);
    }
  }

  bool checka() {
    final isValid = editprofilekey2.currentState!.validate();
    if (!isValid) {
      return false;
    }

    editprofilekey2.currentState!.save();
    updateProfile();
    return true;
  }

  updateProfile() async {
    print(
      getUser[0].id,
    );
    print(name.text);
    print(address.text);
    print(phone.text);
    GraphQLClient client = graphQLConfiguration.clientToQuery();

    QueryResult result = await client.mutate(
      MutationOptions(
        document: gql(UpdateProfileQueryMutation.updateProfile),
        variables: <String, dynamic>{
          'id': getUser[0].id,
          'name': name.text,
          'address': address.text,
          'city': address.text,
          'contact_name': name.text,
          'contact_phone': phone.text,
        },
      ),
    );

    if (!result.hasException) {
      updatepro(true);
      Get.defaultDialog(
          middleText: "Successfully updated",
          backgroundColor: CustomColors.blue,
          titleStyle: const TextStyle(color: Colors.white),
          middleTextStyle: const TextStyle(color: Colors.white),
          radius: 30);

      update();
      //  fetchProfileData();
    } else {
      updatepro(false);

      Get.defaultDialog(
          middleText: "Not updated please try again",
          backgroundColor: Colors.red,
          titleStyle: const TextStyle(color: Colors.white),
          middleTextStyle: const TextStyle(color: Colors.white),
          radius: 30);
    }
  }


  @override
  void onClose() {}
  void increment() => count.value++;
}
