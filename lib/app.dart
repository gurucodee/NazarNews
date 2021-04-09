import 'package:NazarNewsTV/localization/app_localization.dart';
import 'package:NazarNewsTV/localization/local_languages.dart';
import 'package:NazarNewsTV/screens/settings/widgets/app/font_size.dart';
import 'package:NazarNewsTV/screens/settings/widgets/app_description.dart';
import 'package:NazarNewsTV/screens/settings/widgets/app/change_theme.dart';
import 'package:NazarNewsTV/screens/settings/widgets/version/select_languages.dart';
import 'package:NazarNewsTV/screens/youtube/widgets/video_modal.dart';
import 'package:NazarNewsTV/services/user_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:NazarNewsTV/bloc/app_theming/theme_bloc.dart';
import 'package:NazarNewsTV/screens/home/news.dart';
import 'package:NazarNewsTV/screens/about/about.dart';
import 'package:NazarNewsTV/screens/topics/topics.dart';
import 'package:NazarNewsTV/screens/archive/archive.dart';
import 'package:NazarNewsTV/screens/youtube/youtube.dart';
import 'package:NazarNewsTV/screens/post_details/post.dart';
import 'package:NazarNewsTV/screens/settings/app_settings.dart';
import 'package:NazarNewsTV/screens/live_stream/live_stream.dart';
import 'package:NazarNewsTV/screens/global_widgets/customScrollBehavior.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

const HomePageRoute = '/';
const AboutUsRoute = '/about-route';
const TopicsRoute = '/topics-route';
const ArchiveRoute = '/archive-route';
const YoutubeVideosRoute = '/tv-route';
const YoutubeVideoRoute = '/youtube-video';
const PostDetailRoute = '/location_details';
const LiveStreamingRoute = '/streaming-route';

// App settings routes
const AppSettingsRoute = '/settings-route';
/*
 * Choose topics
 * Change language
 */
const AppSettingsTopicsRoute = '/app-settings-topics';
const AppSettingsLanguagesRoute = '/app-settings-languages';

/*
 * Text font size
 * App theme color
 * Data control
 */
const AppSettingsFontSizeRoute = '/app-settings-fontsize';
const AppSettingsChangeThemeRoute = '/app-settings-themes';
const AppSettingsDataControlRoute = '/app-settings-data-control';

/*
 * Agreement
 * App politics
 * About the application
 */
const AppSettingsPoliticsRoute = '/app-settings-politics';
const AppSettingsAgreementRoute = '/app-settings-agreement';
const AppSettingsDescriptionRoute = '/app-settings-descriptionroute';

class App extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    _AppState state = context.findAncestorStateOfType<_AppState>();
    state.setLocale(newLocale);
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Locale _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // Disallow app to
    // rotate inside device
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(builder: _buildAppWithTheme),
    );
  }

  Widget _buildAppWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyScrollBehavior(),
          child: child,
        );
      },
      locale: _locale ?? null,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _routes(),
      theme: state.themeData,
      home: Home(),
      // Localization
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ky', 'Кыргызча'), // Kyrgyz
        const Locale('ru', 'Русский'), // Russian
        const Locale('ar', 'العربية'), // Arabic
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case HomePageRoute:
          screen = Home();
          break;
        case PostDetailRoute:
          screen = PostDetail(
            id: arguments['pid'],
            post: arguments['post'],
          );
          break;
        case YoutubeVideoRoute:
          screen = YoutubeVideoModal(
            video: arguments['videoItem'],
          );
          break;
        case AboutUsRoute:
          screen = AboutUs();
          break;
        case TopicsRoute:
          screen = PostTopics();
          break;
        case ArchiveRoute:
          screen = PostsArchive();
          break;
        case YoutubeVideosRoute:
          screen = YouTubeVideos();
          break;
        case LiveStreamingRoute:
          screen = LiveStream();
          break;
        case AppSettingsRoute:
          screen = AppSettings();
          break;
        case AppSettingsLanguagesRoute:
          screen = AppSettingsLanguages();
          break;
        case AppSettingsChangeThemeRoute:
          screen = AppSettingsChangeTheme();
          break;
        case AppSettingsFontSizeRoute:
          screen = AppSettingsFontSize();
          break;
        case AppSettingsDescriptionRoute:
          screen = ApplicationDescription(
            info: arguments['appInfo'],
          );
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
