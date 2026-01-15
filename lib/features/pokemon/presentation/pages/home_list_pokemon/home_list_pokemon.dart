import 'package:app_multiplier_teste_tecnico/features/pokemon/presentation/state/bloc/home_bloc.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/presentation/state/states/pokemon_home_state.dart';
import 'package:app_multiplier_teste_tecnico/features/pokemon/presentation/widgets/pokemon_grid_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeListPokemon extends StatefulWidget {
  const HomeListPokemon({super.key});

  @override
  State<HomeListPokemon> createState() => _HomeListPokemonState();
}

class _HomeListPokemonState extends State<HomeListPokemon> {
  final _controller = GetIt.I.get<HomeBloc>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    _controller.getlistPokemon();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        _controller.getlistPokemon(loadMore: true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Pokédex',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ValueListenableBuilder<PokemonHomeState>(
        valueListenable: _controller.state,
        builder: (context, state, _) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is FailureState) {
            return Center(
              child: Text(
                state.message,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (state is SucessState) {
            return PokemonGridWidget(
              listaPokemon: state.listaPokemon,
              controller: _scrollController,
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
