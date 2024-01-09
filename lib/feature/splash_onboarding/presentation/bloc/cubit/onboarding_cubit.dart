import 'dart:developer' as dev;
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  final FirebaseAuth auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  // YoutubePlayerController _ytbPlayerController =
  //     YoutubePlayerController(initialVideoId: '');
  // YoutubePlayerController get ytbPlayerController => _ytbPlayerController;

  List<YoutubeVideo> _videos = [];
  List<YoutubeVideo> get videos => _videos;
  Map<String, dynamic> _userDoc = <String, dynamic>{};
  Map<String, dynamic> get userDoc => _userDoc;
  int bottonnavSelectedIndex = 0;
  bool _getCodebutton = false;
  bool get getCodeButton => _getCodebutton;

  // final screens = [
  //   const HomePage(),
  //   const Plans(),
  //   const SizedBox.shrink(),
  //   const Minning(),
  //   const Withdraw(),
  // ];

  String generateCode() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    var code =
        List.generate(6, (index) => chars[random.nextInt(chars.length)]).join();
    dev.log(code);
    return code;
  }

  Future<void> setCodeInFirebase(String code, DateTime expirationTime) async {
    try {
      // Check if a user is authenticated
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        dev.log('User not authenticated. Cannot set code in Firestore.');
        return;
      }

      // Get the current user's ID
      final String userId = user.uid;

      // Replace 'your_collection' with the name of your Firestore collection
      final CollectionReference codesCollection =
          FirebaseFirestore.instance.collection('randomCode');

      // Use the user's ID as the document ID
      final DocumentReference documentReference = codesCollection.doc(userId);

      // Set data in Firestore document
      await documentReference.set({
        'code': code,
        'expirationTime': expirationTime,
      });

      dev.log('Code and expiration time set successfully in Firestore!');
    } catch (error) {
      dev.log('Error setting code in Firestore: $error');
    }
  }

  // Function to check if the code is not expired and is new
  Future<bool> isCodeValid() async {
    // Replace 'your_collection' with the name of your Firestore collection
    final CollectionReference codesCollection =
        FirebaseFirestore.instance.collection('randomCode');

    // Get the current user's ID
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      dev.log('User not authenticated. Cannot check code validity.');
      return false;
    }
    final String userId = user.uid;

    // Replace 'your_document_id' with the actual document ID you want to check
    final DocumentReference documentReference = codesCollection.doc(userId);

    // Fetch the document data
    final DocumentSnapshot documentSnapshot = await documentReference.get();

    // Check if the document exists and the code is not expired and is new
    if (documentSnapshot.exists) {
      final Map<String, dynamic>? data =
          documentSnapshot.data() as Map<String, dynamic>?;
      if (data != null) {
        final String? code = data['code'];
        final Timestamp? expirationTime = data['expirationTime'];

        if (code != null && expirationTime != null) {
          // Replace with the actual logic to determine if the code is valid
          final bool codeIsValid = !isCodeExpired(expirationTime);
          _getCodebutton = codeIsValid;
          return codeIsValid;
        }
      }
    }

    return false;
  }

  Future<String?> getRandomCode() async {
    try {
      // Replace 'your_collection' with the name of your Firestore collection
      final CollectionReference codesCollection =
          FirebaseFirestore.instance.collection('randomCode');

      // Get the current user's ID
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        dev.log('User not authenticated. Cannot get random code.');
        return null;
      }

      // Replace 'your_document_id' with the actual document ID you want to retrieve
      final DocumentReference documentReference = codesCollection.doc(user.uid);

      // Fetch the document data
      final DocumentSnapshot documentSnapshot = await documentReference.get();

      // Check if the document exists and contains a code
      if (documentSnapshot.exists) {
        final Map<String, dynamic>? data =
            documentSnapshot.data() as Map<String, dynamic>?;

        if (data != null) {
          final String code = "Code: " + data['code'];

          if (code != null) {
            dev.log('Random code retrieved successfully: $code');
            return code;
          }
        }
      }

      return null;
    } catch (error) {
      dev.log('Error getting random code: $error');
      return null;
    }
  }

  // Function to check if the code is expired
  bool isCodeExpired(Timestamp expirationTime) {
    final Timestamp now = Timestamp.now();
    return now.toDate().isAfter(expirationTime.toDate());
  }

  delaySplash() async {
    emit(OnboardingLoadingState());
    await Future.delayed(const Duration(seconds: 5));
    emit(OnboardingLoadedState());
  }

  Future checkUserSigin() async {
    emit(OnboardingLoadingState());
    if (FirebaseAuth.instance.currentUser == null) {
      dev.log('null');
      emit(const OnboardingError(error: 'error'));
    } else {
      dev.log('valid');
      emit(OnboardingSigin());
    }
  }

  void changebottomnavindex({required int index}) {
    emit(OnboardingLoadingState());
    bottonnavSelectedIndex = index;
    emit(OnboardingLoadedState());
  }

  googleSignIn() async {
    emit(OnboardingLoadingState());
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      var credietial = await auth.signInWithProvider(googleAuthProvider);
      addUserInfo();
      emit(OnboardingSigin());
    } catch (error) {
      emit(const OnboardingError(error: 'error'));
      dev.log(error.toString());
    }
  }

  Future<void> signOut() async {
    emit(OnboardingLoadingState());
    try {
      await auth.signOut();
      emit(
          OnboardingSiginOut()); // You can define this state in onboarding_state.dart
    } catch (error) {
      emit(const OnboardingError(error: 'Error signing out'));
      dev.log(error.toString());
    }
  }

  addUserInfo() {
    dev.log(auth.currentUser!.displayName.toString());
    dev.log(auth.currentUser!.email.toString());
    firestore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .set(<String, dynamic>{
      'email': auth.currentUser!.email,
      'avatar': auth.currentUser!.photoURL,
      'name': auth.currentUser!.displayName,
    });
  }

  Future getUserData() async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userDoc =
          await firestore.collection('users').doc(auth.currentUser!.uid).get();
      if (userDoc.exists) {
        _userDoc = userDoc.data() ?? <String, dynamic>{};
        dev.log('User data: ${userDoc.data()}');
      } else {
        dev.log('User data not found');
      }
    } catch (error) {
      dev.log('Error fetching user data: $error');
    }
  }

  Future getvideo() async {
    try {
      await FirebaseFirestore.instance
          .collection('youtubeVideos')
          .get()
          .then((snapshot) async {
        if (snapshot.docs.isNotEmpty) {
          for (var co in snapshot.docs) {
            _videos.add(YoutubeVideo.fromJson(co.data()));
            // _ytbPlayerController = YoutubePlayerController(
            //     initialVideoId:
            //         YoutubePlayer.convertUrlToId(_videos[0].url ?? '') ?? '',
            //     flags: YoutubePlayerFlags());
            dev.log(videos.first.url.toString());
            dev.log(co.data().toString());
          }
        }
      });
    } catch (e) {
      dev.log(e.toString());
    }
  }
}

checkvideocode() {}

class YoutubeVideo {
  String? code;
  String? url;
  YoutubeVideo({this.code, this.url});
  YoutubeVideo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    url = json['videourl'];
  }
}
