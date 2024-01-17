import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/infrastructure/repositories/gallery_repository_impl.dart';
import 'package:gallery_app/presentation/bloc/gallery_bloc.dart';
import 'package:gallery_app/presentation/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          GalleryBloc(galleryRepository: GalleryRepositoryImpl())
            ..add(GalleryFetched()),
      child: _BodyHomeView(size: size),
    );
  }
}

class _BodyHomeView extends StatefulWidget {
  const _BodyHomeView({
    required this.size,
  });

  final Size size;

  @override
  State<_BodyHomeView> createState() => _BodyHomeViewState();
}

class _BodyHomeViewState extends State<_BodyHomeView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<GalleryBloc>().add(GalleryFetched());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
            titlePadding: EdgeInsets.zero,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return BlocBuilder<GalleryBloc, GalleryState>(
                builder: (context, state) {
                  switch (state.status) {
                    case GalleryStatus.failure:
                      return const Center(
                          child: Text("Error al obtener las imagenes"));
                    case GalleryStatus.success:
                      if (state.photos.isEmpty) {
                        return const Center(child: Text("No hay imagenes"));
                      }
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: widget.size.height * 0.9,
                        child: GridView.builder(
                          padding: const EdgeInsets.only(bottom: 80),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: state.photos.length,
                          controller: _scrollController,
                          itemBuilder: (context, index) {
                            return ImageItem(photo: state.photos[index]);
                          },
                        ),
                      );
                    case GalleryStatus.initial:
                      return const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                  }
                },
              );
            },
            childCount: 1,
          ),
        ),
      ],
    );
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.8);
  }
}
