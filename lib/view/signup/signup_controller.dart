import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../models/user_model.dart';

class SignupController extends GetxController{

  RxBool isLoading=false.obs;
  final registerKey=GlobalKey<FormState>();

  late final TextEditingController emailTextEditingController;
  late final TextEditingController passwordTextEditingController;
  late final TextEditingController userNameTextEditingController;



  @override
  void onInit() {

    emailTextEditingController=TextEditingController();
    passwordTextEditingController=TextEditingController();
    userNameTextEditingController=TextEditingController();


    super.onInit();
  }


signUp() async {



try {
                              isLoading.value=true;

  
//   final UserCredential credential=await FirestoreServices().registerWithEmailAndPassword(emailTextEditingController.text, passwordTextEditingController.text);
// final UserModel user=UserModel(userName: userNameTextEditingController.text,email: emailTextEditingController.text);

// await FirestoreServices().addUserToFirestore(user,credential.user!.uid).catchError((error){
//                               isLoading.value=false;



// Text(error.toString());
// });
//                               isLoading.value=false;

  
} 
on FirebaseAuthException catch (e) {

                              isLoading.value=false;

  if (e.code == 'weak-password') {

      return showErrorDialogue("weak password");
  } else if (e.code == 'email-already-in-use') {

      return showErrorDialogue("Email already exists");

   

   
  }
  else{

      return showErrorDialogue(e.code);

  }
} catch (e) {
        return showErrorDialogue(e.toString());

}



  }

    showErrorDialogue(String error) async {


    return await Get.defaultDialog(
onCancel: (){},
      barrierDismissible: false,
      
      radius: 5.0,
      content: Text(error),
      title: "Error ❎");
  }

}