class AppLanguage {
  final int id;
  final String flag;
  final String name;
  final String languageCode;
  final String languageDescription;

  AppLanguage(this.id, this.name, this.languageCode, this.flag, this.languageDescription);

  static List<AppLanguage> languageList() {
    return <AppLanguage>[
      AppLanguage(1, "Русский", "ru", "🇷🇺", "Русский язык"),
      AppLanguage(2, "Кыргызча", "ky", "🇰🇬", "Орус тили"),
      AppLanguage(3, "العربية", "ar", "🇸🇦", "اللغة العربية"),
    ];
  }
}