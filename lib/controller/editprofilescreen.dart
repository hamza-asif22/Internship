import 'package:flutter/material.dart';
import 'package:task1/model/editprofilescreen.dart';

class EditProfileController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final bioController = TextEditingController();

  final user = EditProfileModel();

  EditProfileController() {
    nameController.text = user.name;
    emailController.text = user.email;
    phoneController.text = user.phone;
    bioController.text = user.bio;
  }
}
