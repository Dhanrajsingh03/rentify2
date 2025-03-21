import 'package:flutter/material.dart';

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({super.key});

  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar>
    with SingleTickerProviderStateMixin {
  late TextEditingController _searchController;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  List<String> items = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
    'Grape',
    'Honeydew',
    'Iceberg lettuce',
    'Jackfruit',
    'Kiwi',
    'Lemon',
    'Mango',
    'Nectarine',
    'Orange',
    'Papaya',
    'Quince',
    'Raspberry',
    'Strawberry',
    'Tomato',
    'Ugli fruit',
    'Watermelon',
  ];

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredItems =
          items.where((item) => item.toLowerCase().contains(query)).toList();
    });

    if (_searchController.text.isNotEmpty) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          // Search Bar with Animation
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Your Ideal Place...',
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.search, color: Colors.white),
                  ),
                ),
                filled: true,
                fillColor: Colors.grey.shade300,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                suffixIcon:
                    _searchController.text.isNotEmpty
                        ? IconButton(
                          icon: Icon(Icons.clear, color: Colors.redAccent),
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                              filteredItems.clear();
                              _animationController.reverse();
                            });
                          },
                        )
                        : null,
              ),
            ),
          ),

          // Results with Animation
          Expanded(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child:
                  filteredItems.isEmpty
                      ? Center(
                        child: Text(
                          _searchController.text.isEmpty
                              ? 'Start typing to search...'
                              : 'No results found',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                      : ListView.builder(
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.food_bank, color: Colors.green),
                            title: Text(
                              filteredItems[index],
                              style: TextStyle(fontSize: 18.0),
                            ),
                            trailing: Icon(
                              Icons.navigate_next,
                              color: Colors.blue,
                            ),
                            onTap:
                                () =>
                                    print('Tapped on ${filteredItems[index]}'),
                          );
                        },
                      ),
            ),
          ),
        ],
      ),
    ); //ending here
  }
}
