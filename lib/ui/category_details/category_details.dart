import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/DI/di.dart';
import 'package:news_app/model/category_model/categoeryItemModel.dart';
import 'package:news_app/shared/reusable_widget/tabBar_Item.dart';
import 'package:news_app/ui/category_details/view_model/CategoryDetailsViewModel.dart';
import 'package:news_app/ui/home/categories_widget/news_list_widget.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({super.key, required this.category});
  CategoryItemModel category;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int  selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<CategoryDetailsViewModel>()..getSources(widget.category.id),
      child: BlocBuilder<CategoryDetailsViewModel, CategoryDetailsStates>(
        buildWhen: (previous, current) =>
        current is CategoryDetailsInitState ||
        current is SourcesSuccessState ||
        current is SourcesErrorState ||
        current is SourcesLoadingState,
        builder: (BuildContext context, CategoryDetailsStates state) {
          CategoryDetailsViewModel categoryDetailsViewModel = BlocProvider.of<CategoryDetailsViewModel>(context);
          if (state is SourcesSuccessState) {
            var sourcesList = state.sources;
            return DefaultTabController(
              initialIndex: selectedIndex,
              length: sourcesList.length,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    TabBar(
                        onTap: (index) {
                          selectedIndex = index;
                          setState(() {
                            categoryDetailsViewModel.getNews(sourcesList[selectedIndex].id??"");
                          });
                        },
                        indicatorColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                        isScrollable: true,
                        tabs: sourcesList.map((source) {
                          return TabBarItem(
                              source: source,
                              isSelected:
                                  selectedIndex == sourcesList.indexOf(source));
                        }).toList()),
                    SizedBox(
                      height: 5,
                    ),
                    NewsListWidget(source: sourcesList[selectedIndex]),
                  ],
                ),
              ),
            );
          } else if (state is SourcesErrorState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.errorMessage),
                ElevatedButton(onPressed: () {}, child: Text("Try Again"))
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
