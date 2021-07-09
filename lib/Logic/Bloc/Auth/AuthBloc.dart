import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/Logic/Bloc/Auth/AuthStates.dart';
import 'package:social/Logic/models/Registermodel.dart';

class AuthCubit extends Cubit<AuthStates> {

  AuthCubit() : super(InitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

  //create instance from firebase authentication
  FirebaseAuth auth = FirebaseAuth.instance;

  //this variable check if the user allowed to login
  bool check = true;

  //create instance from firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //Register new user to FirebaseAuth
  Future UserRegister(String email, String pass, String phone) {

    emit(RegisterLoading());
    auth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((value) {
      print('successfully registered----------------');
      emit(RegisterSuccess());
      String UserId = FirebaseAuth.instance.currentUser.uid;
      SaveInFireStore(
        'pot',
        email,
        pass,
        phone,
        'not assigned yet',
        'http://www.elmuster.com/public/uploads/all/OvNwsF7HJxYUfGLFjrGifS0NF8PVWryXdGIXTs4Q.png',
        'https://cdn.pixabay.com/photo/2021/06/23/07/05/sea-6357926_960_720.jpg',
        UserId,
      );
      print('save in firestore successfully');
    }).catchError((error) {
      print(error);
      emit(RegisterFail());
    });
  }

  //this method save our data to the firestore
  void SaveInFireStore(
    String name,
    String email,
    String password,
    String phone,
    String bio,
    String profilimage,
    String coverImage,
    String uid,
  ) {
    RegisterUser model = RegisterUser(
      name: name,
      email: email,
      password: password,
      phone: phone,
      bio: bio,
      profilimage: profilimage,
      coverimage: coverImage,
    );
    try {
      firestore.collection('Users').doc(uid).set(model.tomap());
      emit(SaveSuccess());
    } catch (x) {
      print('error' + x + 'happend');
      emit(SaveFail());
    }
  }

  //this method log the user into the system
  Future LogIn(String email, String password) {
    emit(LoginLoading());
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      emit(LoginSuccess());
      print('Loged in successfully');
    }).catchError((error) {
      print(error);
      emit(LoginFail());
    });
  }

  //this method check the vesibility of the password text field
  bool IsObs = true;

  void ChangeObs(){
    IsObs = !IsObs;
  }
}
