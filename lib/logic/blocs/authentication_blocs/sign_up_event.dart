import 'package:equatable/equatable.dart';
import 'package:communitytabs/logic/constants/enums.dart';

abstract class SignUpEvent extends Equatable{
  const SignUpEvent();
}// SignUpEvent

class SignUpEventSignUp extends SignUpEvent {
  final SignUpType signUpType;
  final hashedEmail;
  final hashedPassword;

  SignUpEventSignUp(
      {required this.hashedEmail,
        required this.hashedPassword,
        required this.signUpType});

  @override
  List<Object> get props => [this.hashedEmail, this.hashedPassword];
} // SignUpEventSignUp
