import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/gif_provider.dart';
import '../widgets/gif_tile.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<GifProvider>(context, listen: false).fetchGifs();
  }

  @override
  Widget build(BuildContext context) {
    final gifProvider = Provider.of<GifProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Giphy Search')),
      body: Column(
        children: [
          SearchBarWidget(
            onSearch: (query) {
              gifProvider.fetchGifs(query: query);
            }, // 🔹 Calls API directly
          ),
          Expanded(
            child: Consumer<GifProvider>(
              builder: (context, provider, child) {
                if (provider.gifs.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1,
                  ),
                  itemCount: provider.filteredGifs.length,
                  itemBuilder: (context, index) {
                    return GifTile(gif: provider.filteredGifs[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
