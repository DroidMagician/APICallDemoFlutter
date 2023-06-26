import 'package:apicalldemo/navigationDrawer/SecondFragment.dart';
import 'package:apicalldemo/navigationDrawer/SubCategoryItemDetails.dart';
import 'package:apicalldemo/network/SubCategoryResponseModel.dart';
import 'package:apicalldemo/network/base_api_response_array.dart';
import 'package:flutter/material.dart';
import '../network/DioClient.dart';


class FirstFragment extends StatefulWidget {
  const FirstFragment({Key? key}) : super(key: key);

  @override
  State<FirstFragment> createState() => _FirstFragmentState();
}

class _FirstFragmentState extends State<FirstFragment> with TickerProviderStateMixin{
  final DioClient client = DioClient();
  List<SubCategoryResponseModel> subcategoryResponse = [];
  late TabController myTabController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      Future<BaseApiResponseArray<SubCategoryResponseModel>?> baseApiResponseArray =  client
          .getSubCategoryList();

      baseApiResponseArray?.then((value) => value?.data?.forEach((element) {
        setState(() {
          subcategoryResponse.add(element);
        });
      }));
    });

    var lastIndex = subcategoryResponse.length - 1;

    myTabController = new TabController(
        vsync: this,
        length: subcategoryResponse.length,
        initialIndex: 1
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Inside Build");
    return SafeArea(
        child: DefaultTabController(
          length: subcategoryResponse.length,
          child: Scaffold(
            appBar: TabBar(
              isScrollable: true,
              tabs: subcategoryResponse.map((databaseItem) =>
                  Padding(padding: const EdgeInsets.only(top: 12, bottom: 12), child: Text('${databaseItem.subCategoryName.toString()}',style: TextStyle(color: Colors.black),)),
              ).toList()
            ),
            body: TabBarView(
              children: subcategoryResponse
                  .map((g) => SubCategoryItemDetails(responseModel: g,))
                  .toList(),
            ),
          ),
        )
    );
  }
}

