
//this class contain the states of our project
abstract class AuthStates{}

//this class represent the initial state of our app
class InitialState extends AuthStates{}

//User register states
class RegisterLoading extends AuthStates{}
class RegisterSuccess extends AuthStates{}
class RegisterFail extends AuthStates{}

//User login states
class LoginLoading extends AuthStates{}
class LoginSuccess extends AuthStates{}
class LoginFail extends AuthStates{}

//save data in firestore state
class SaveSuccess extends AuthStates{}
class SaveFail extends AuthStates{}