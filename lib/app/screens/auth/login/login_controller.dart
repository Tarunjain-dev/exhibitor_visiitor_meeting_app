import 'package:exhibitor_visiitor_meeting_app/app/constants/firebase_constants.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  var isLoading = false.obs;

  login({required String userEmail, required String userPassword}){
    firebaseAuth.signInWithEmailAndPassword(
      email: userEmail,
      password: userPassword,
    ).then((value) async{
      // if login process completed, "then" Block executes
      String UID = firebaseAuth.currentUser!.uid.toString();

      /// start from here...
      await fetchUserData(UID);

      isLoading.value = false;
      Get.snackbar("Login Successful:", " User $userEmail has successfully login");
      Get.offNamed("/home");
    }).onError((error, stackTrace) {
      // in case of any error, we can catch here.
      Get.snackbar("Login Error:", error.toString());
      isLoading.value = false;
    },);
  }

  fetchUserData(String userID){

  }

}