import 'dart:io';

import 'package:chat_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;
  Directory? directory;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  // UserCredential? userCredential;

  GoogleSignInAccount? get currentUser => _currentUser;

  Future<void> firstInitialized() async {
    //AUTO Login
    await autoLogin().then((value) {
      if (value) {
        isAuth.value = true;
      }
    });

    //Skipp Introduction
    await skipIntro().then((value) {
      if (value) {
        isSkipIntro.value = true;
      }
    });
  }

  Future<bool> autoLogin() async {
    try {
      final isSignIn = await _googleSignIn.isSignedIn();
      print('current user :$_currentUser');
      if (_currentUser == null) {
        return false;
      }
      if (isSignIn) {
        return true;
      }
      return false;
    } catch (error) {
      return false;
    }
  }

  Future<bool> skipIntro() async {
    final box = GetStorage();
    if (box.read('skipIntro') != null || box.read('skipIntro') == true) {
      return true;
    }
    return false;
  }

  Future<void> login() async {
    try {
      await _googleSignIn.signOut();
      await _googleSignIn.signIn().then((value) => _currentUser = value);

      final isSignIn = await _googleSignIn.isSignedIn();
      Get.offAllNamed(Routes.HOME);
      if (isSignIn) {
        final googleAuth = await _currentUser!.authentication;
        print('Berhasil Login ${_currentUser}');
        // final credential = GoogleAuthProvider.credential(
        //     accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

        // await FirebaseAuth.instance
        //     .signInWithCredential(credential)
        //     .then((value) => userCredential = value);
        // print('USER CREDENTIAL $userCredential');

        final box = GetStorage();
        if (box.read('skipIntro') != null) {
          box.remove('skipIntro');
        }
        box.write('skipIntro', true);
        isAuth.value = true;
        Get.offAllNamed(Routes.HOME);
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  Future<void> createFolder({String name = 'Nandos'}) async {
    directory = await getApplicationDocumentsDirectory();

    // directory = Directory("storage/emulated/0/Nandos");
    print('Directory Path : ${directory?.path}');
    if (directory?.existsSync() ?? false) {
      // TODO:
      print("exist");
    } else {
      // TODO:
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        print('NOT granted');
        await Permission.storage.request();
      }
      print("not exist");
      directory?.create();
    }
  }
}
