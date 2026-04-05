import 'package:application_evently/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../cache/cache_helper.dart';
import '../../l10n/app_localizations.dart';
import '../../provider/theme_provider.dart';
import '../../provider/language_provider.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_routes.dart';
import '../../utils/app_styles.dart';
import '../../utils/media_query_size.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}
class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDark;
    final langProvider = Provider.of<LanguageProvider>(context);
    final isEnglish = langProvider.appLanguage == 'en';


    final pages = [
      _buildFirstPage(isDark, themeProvider, langProvider, isEnglish ),
      _buildPage(isDark,
         AppAssets.onBoarding2,
          AppAssets.onBoarding2Dark,
          AppLocalizations.of(context)!.title_2boarding,
          AppLocalizations.of(context)!.body_2boarding
      ),
      _buildPage(isDark,
          AppAssets.onBoarding3,
          AppAssets.onBoarding3Dark,
          AppLocalizations.of(context)!.title_3boarding,
          AppLocalizations.of(context)!.body_3boarding
      ),
      _buildPage(isDark,
          AppAssets.onBoarding4,
          AppAssets.onBoarding4Dark,
          AppLocalizations.of(context)!.title_4boarding,
          AppLocalizations.of(context)!.body_4boarding
      ),
    ];

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBgColor: const Color(0xFFF4F7FF),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.only(top: context.height*0.02,
              left: context.width*0.0002,
              right: context.width*0.0002),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Image.asset(
                  isDark
                      ? AppAssets.eventlyDarkLogo
                      : AppAssets.eventlyLightLogo,
                  height: 40,
                ),
              ),

              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  children: pages,
                ),
              ),
              const SizedBox(height: 24),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  isDark ? AppColors.mainDarkColor: AppColors.mainLightColor ,
                      padding:  EdgeInsets.symmetric(vertical: context.height*0.017,
                          horizontal: context.width*0.35),
                      elevation: 0,
                      textStyle: const TextStyle(),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () async {
                      if (_currentPage == pages.length - 1) {
                        await CacheHelper.saveData(key: 'isOnboardingDone', value: true);
                        Navigator.pushReplacementNamed(context, AppRoutes.homeRouteName);
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: Text(
                      _currentPage == 0
                          ? AppLocalizations.of(context)!.lets_start
                          : _currentPage == pages.length - 1
                          ? AppLocalizations.of(context)!.get_started
                          : AppLocalizations.of(context)!.next,
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage(bool isDark, String image, String imageDark, String title, String body) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: context.width*0.04),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start ,
        children: [

          Expanded(child: Image.asset(isDark? imageDark : image,)),
          const SizedBox(height: 16),
          Text(title,textAlign: TextAlign.start,
              style:isDark ? AppStyles.semi20White: AppStyles.semi20Black),


          const SizedBox(height: 8),
          Text(body,
            textAlign: TextAlign.start,
            style: isDark ? AppStyles.regular16GreyDarkMode: AppStyles.regular16GreyLightMode,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildFirstPage(bool isDark, ThemeProvider themeProvider, LanguageProvider langProvider, isEnglish ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Image.asset(
                isDark
                    ? AppAssets.onBoarding1Dark
                    : AppAssets.onBoarding1,fit: BoxFit.fill ,
              )),
          const SizedBox(height: 16),
          Text(AppLocalizations.of(context)!.title_1boarding,

              style:isDark ? AppStyles.semi20White: AppStyles.semi20Black),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.body_1boarding,
            textAlign: TextAlign.start,
            style: isDark ? AppStyles.regular16GreyDarkMode: AppStyles.regular16GreyLightMode,
          ),
          const SizedBox(height: 24),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.language,
                  style: isDark ? AppStyles.medium18WhiteColor: AppStyles.medium18MainLightColor),
              Row(
                children: [

                  GestureDetector(
                    onTap: () => langProvider.changeLanguage('en'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          color: isEnglish ? (isDark ? AppColors.mainDarkColor: AppColors.mainLightColor)
                              :(isDark ? AppColors.darkBgColor : AppColors.whiteColor),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isEnglish ? (isDark ? AppColors.transparentColor: AppColors.transparentColor)
                                :(isDark ? AppColors.strokeDarkColor : AppColors.strokeWhiteColor),
                            width: 2,
                          )
                      ),
                      child: Text(
                        AppLocalizations .of(context)!.english,
                        style:
                        isEnglish ? (isDark ? AppStyles.semi14White :AppStyles.semi14White):
                        (isDark ? AppStyles.regular14White :AppStyles.regular14MainLightColor
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),

                  GestureDetector(
                    onTap: () => langProvider.changeLanguage('ar'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                          color: !isEnglish ?(isDark ? AppColors.mainDarkColor: AppColors.mainLightColor)
                              :(isDark ? AppColors.darkBgColor : AppColors.whiteColor),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: !isEnglish ?(isDark ? AppColors.transparentColor: AppColors.transparentColor)
                                :(isDark ? AppColors.strokeDarkColor : AppColors.strokeWhiteColor),
                          )
                      ),
                      child: Text(
                          AppLocalizations.of(context)!.arabic ,
                          style:
                          !isEnglish ?(isDark ? AppStyles.semi14White :AppStyles.semi14White):
                          (isDark ? AppStyles.regular14White :AppStyles.regular14MainLightColor)
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.theme,
                  style:  isDark ? AppStyles.medium18WhiteColor : AppStyles.medium18MainLightColor),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      themeProvider.changeTheme(ThemeMode.light);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: context.width*0.04,
                          vertical: context.height*0.006),
                      decoration: BoxDecoration(
                          color: !isDark ?AppColors.mainLightColor :AppColors.inputStrokeDarkColor ,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: !isDark ?AppColors.transparentColor :AppColors.strokeDarkColor ,
                            width: 2,
                          )
                      ),
                      child: Icon(isDark ?Icons.wb_sunny_outlined:Icons.sunny,
                          color: AppColors.whiteColor),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      themeProvider .changeTheme(ThemeMode.dark);
                    },
                    child: Container(
                      padding:  EdgeInsets.symmetric(horizontal: context.width*0.04, vertical: context.height*0.006),
                      decoration: BoxDecoration(
                          color: isDark ? AppColors.mainDarkColor : AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isDark ? AppColors.transparentColor : AppColors.strokeWhiteColor,
                            width: 2,
                          )
                      ),
                      child: Icon(isDark ? Icons.dark_mode_rounded : Icons.dark_mode_outlined,
                          color: isDark? AppColors.whiteColor : AppColors.mainLightColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}