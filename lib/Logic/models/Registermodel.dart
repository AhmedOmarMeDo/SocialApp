class RegisterUser {
  String name;
  String email;
  String password;
  String phone;
  String profilimage;
  String coverimage;
  String bio;

  //this the constructor which assign data to our attributes
  RegisterUser({
    this.bio,
    this.coverimage,
    this.email,
    this.name,
    this.password,
    this.phone,
    this.profilimage,
  });

  //this method which send our data to the firestore as a map
  Map<String, dynamic> tomap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'profilimage': profilimage,
      'coverimage': coverimage,
      'bio': bio,
    };
  }
}
