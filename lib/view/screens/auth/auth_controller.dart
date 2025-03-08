import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_clean_admin/view/screens/dashboard/dashboard_screen.dart';
import 'package:smart_clean_admin/view/screens/home/home_controller.dart';
import 'package:smart_clean_admin/view/screens/home/home_screen.dart';

class AuthController extends GetxController {
  // Firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Form Key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Controllers for text fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Reactive variable to track loading state
  var isLoading = false.obs;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  // Sign-up function with validation and error handling
  Future<void> signUp() async {
    if(!formKey.currentState!.validate()){
      return;
    }
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar("Error", "All fields are required");
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match");
      return;
    }
    else {
      try {
        isLoading.value = true; // Show loading indicator
        await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        Get.snackbar("Success", "Account created successfully!");
        // Navigate to another screen after successful signup
        Get.offAll(() => DashboardScreen()); // Uncomment when you have a HomeScreen
      } catch (e) {
        Get.snackbar("Sign Up Failed", e.toString());
      } finally {
        isLoading.value = false; // Hide loading indicator
      }
    }
  }
}
