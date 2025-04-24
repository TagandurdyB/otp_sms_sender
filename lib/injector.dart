import 'config/core/exports.dart';

class Injector extends StatelessWidget {
  final Widget child;
  const Injector(this.child, {super.key});

  Map<String, dynamic> createRepos() => {
        // 'category': CategoryRepo(CategorySource()),
        // 'card': CardRepo(CardSource()),
        // 'sound_service': SoundService(),
      };

  @override
  Widget build(BuildContext context) {
    final repos = createRepos();
    // final repoProviders = getRepositories(repos);
    final providers = getProviders(repos);
    return MultiBlocProvider(
        providers: providers,
        child: Builder(builder: (context) {
          return child;
        }));
  }

  List<RepositoryProvider> getRepositories(Map<String, dynamic> repos) => [
        // createRepoProvider<CategoryRepo>(repos['category']),
        // createRepoProvider<CardRepo>(repos['card']),
        // createRepoProvider<SoundService>(repos['sound_service']),
      ];

  RepositoryProvider<T> createRepoProvider<T>(T repo) {
    return RepositoryProvider<T>(create: (context) => repo);
  }

  List<BlocProvider> getProviders(Map<String, dynamic> repos) => [
        //====================================================
        // BlocProvider<CategoryCubit>(
        //     create: (context) => CategoryCubit(repos['category'])),
        // BlocProvider<CardsCubit>(
        //     create: (context) => CardsCubit(repos['card'])),
        // BlocProvider<SelectedCardCubit>(
        //     create: (context) => SelectedCardCubit()),
        //====================================================
        // BlocProvider<NavCubit>(create: (context) => NavCubit()),
        BlocProvider<ResponsiveCubit>(
            create: (context) => ResponsiveCubit()..init()),
      ];
}
