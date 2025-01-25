import 'package:exhibitor_visiitor_meeting_app/app/constants/firebase_constants.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{

  var isLoading = false.obs;


  // signup() method
  signup({
    required String userEmail,
    required String userPassword,
    required String userName,
    required String userRole,
  }){
    isLoading.value = true;
    // Signup backend code here...
    firebaseAuth.createUserWithEmailAndPassword(
      email: userEmail,
      password: userPassword,
    ).then((value){
      // if the signup process completes then store the user credentials and its role in the "users" collection in fireStore database.
      String UID = firebaseAuth.currentUser!.uid.toString();
      usersCollection.doc(UID).set({
        "uid" : UID,
        "name" : userName,
        "email" : userEmail,
        "password" : userPassword,
        "phone_number" : "",
        "company_name" : "",
        "company_description" : "",
        "role" : userRole,
        "qr_id" : UID,
        "profile_img_url" : "",
      }).then((value) {
        // if user is signup and its credentials are stored in fireStore database, then.
        Get.offNamed('/login'); // navigate back to login screen
        Get.snackbar("Signup Successful:", "User $userEmail has successfully created.");
        isLoading.value = false;
      },).onError((error, stackTrace) {
        // in case of any error or exception to catch here....
        Get.snackbar("Signup Error:", error.toString());
        isLoading.value = false;
      },);
    }).onError((error, stackTrace) {
      // in case of any error or exception to catch here....
      Get.snackbar("Signup Error:", error.toString());
      isLoading.value = false;
    },);
  }


}