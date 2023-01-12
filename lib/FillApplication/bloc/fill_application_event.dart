part of 'fill_application_bloc.dart';

@immutable
abstract class FillApplicationEvent {}

class ApplicationFillEvent extends FillApplicationEvent {
  ApplicationFillEvent({

    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobNo,
    required this.country,
    required this.city,
    required this.jobTitle,
    required  this.jobType,
    required this.educationLevel,
    required this.skills,    
    required this.Certificates,
    });
  String firstName;
  String lastName;
  String email;
  String mobNo;
  String country;
  String city;
  String jobTitle;
  String jobType;
  String educationLevel;
  String skills;
  String Certificates;
}
