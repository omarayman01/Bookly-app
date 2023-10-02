import 'package:bookly_app/view/constants/colors.dart';
import 'package:bookly_app/view/constants/service_locator.dart';
import 'package:bookly_app/view/views/splash_view.dart';
import 'package:bookly_app/view_model/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/view_model/cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/view_model/repos/home_repo_implementation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(getIt.get<HomeRepImpl>())
              ..fetchFeaturedBooks()),
        BlocProvider(
            create: (context) =>
                NewestBooksCubit(getIt.get<HomeRepImpl>())..fetchNewestBooks())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: MyColors.mainColor,
            textTheme:
                GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
        home: const SplashView(),
      ),
    );
  }
}
