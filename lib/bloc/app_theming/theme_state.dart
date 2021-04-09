part of 'theme_bloc.dart';

class ThemeState extends Equatable {

  final ThemeData themeData;

  const ThemeState({
    @required this.themeData,
  });
  
  @override
  List<Object> get props => [themeData];
}

class ThemeInitial extends ThemeState {}
