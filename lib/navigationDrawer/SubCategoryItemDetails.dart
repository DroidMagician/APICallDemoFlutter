import 'package:apicalldemo/navigationDrawer/SecondFragment.dart';
import 'package:apicalldemo/network/SubCategoryResponseModel.dart';
import 'package:apicalldemo/network/base_api_response_array.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scrollview_observer/scrollview_observer.dart';

import '../main.dart';
import '../network/DioClient.dart';
import '../network/ProductDetailsResponse.dart';
import '../translation/translation_strings.dart';

class SubCategoryItemDetails extends StatefulWidget {
  SubCategoryResponseModel? responseModel;

  SubCategoryItemDetails({Key? key, this.responseModel}) : super(key: key);

  @override
  State<SubCategoryItemDetails> createState() => _SubCategoryItemDetailsState();
}
final PageController pageController = PageController(initialPage: 0);
ScrollController scrollController = ScrollController();
ListObserverController observerController = ListObserverController(controller: scrollController);

class _SubCategoryItemDetailsState extends State<SubCategoryItemDetails>
    with AutomaticKeepAliveClientMixin<SubCategoryItemDetails> {
  final DioClient client = DioClient();

  List<ProductDetailsResponse> productDetails = [];
  var currentIndex= 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productDetails.clear();
      Future<BaseApiResponseArray<ProductDetailsResponse>?>
          baseApiResponseArray = client.getProductDetails(
              subCategoryId: widget.responseModel?.id ?? 0);

      baseApiResponseArray?.then((value) => value?.data?.forEach((element) {
            setState(() {
              productDetails.add(element);
            });
          }));
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant SubCategoryItemDetails oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 50,
              child:
              ListViewObserver(
                  controller: observerController,
                  child:   ListView.builder(
                    controller: scrollController,
                    //physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.vertical,
                    itemCount: productDetails.length,
                    itemBuilder: (context, index) =>
                        getImageView(productDetails[index],index),
                  ),
              )
            ),
          ),
          Expanded(
              flex: 3,
              child: PageView(
                scrollDirection: Axis.vertical,
                controller: pageController,
                children: getFullItemView(),
                onPageChanged: (int page) {
                  print("Page Index == ${page}");
                  setState(() {
                    currentIndex = page;
                    // Jump to the specified index position with animation.
                    observerController.animateTo(
                      index: page,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.ease,
                    );
                  });
                },
              ),),
          // ScopedModelDescendant<AppModel>(
          //     builder: (context, child, model) =>
          //     MaterialButton(
          //       onPressed: () {
          //         model.changeDirection();
          //       },
          //       height: 60.0,
          //       color: const Color.fromRGBO(119, 31, 17, 1.0),
          //       child: new Text(
          //         Translations.of(context)?.language ?? "",
          //         style: new TextStyle(
          //           color: Colors.white,
          //           fontSize: 20.0,
          //           fontWeight: FontWeight.w300,
          //           letterSpacing: 0.3,
          //         ),
          //       ),
          //     )
          //     )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => false;

  getImageView(ProductDetailsResponse productDetail, int index) {
    final borderRadius = BorderRadius.circular(20); // Image border

    return
      GestureDetector(
         onTap: ()
        {
          print("List To current Index ${index}");
          pageController.jumpToPage(index);
        },
        child: Container(
          padding: EdgeInsets.all(8), // Border width
          width: 90,
          height: 90,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(color: index == currentIndex ? Colors.red : Colors.white, borderRadius: borderRadius),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: SizedBox.fromSize(
              size: Size.fromRadius(48), // Image radius
              child: Image.network(productDetail.productMedia?.first.url ?? "", fit: BoxFit.cover),
            ),
          ),
        ),
      );

    //   Container(
    //   width: 90,
    //   height: 90,
    //   padding: EdgeInsets.all(10),
    //   child: Image.network(
    //     productDetail.productMedia?.first.url ?? "",
    //     fit: BoxFit.fill,
    //   ),
    // );
  }

  getFullItemView() {
    List<Widget> myList = [];
    print(productDetails.length);
    for (int i = 0; i < productDetails.length; i++) {
      myList.add(Container(
        child: Center(
            child: Image.network(
          productDetails[i].productMedia?.first.url ?? "",
          fit: BoxFit.fill,
        )),
      ));
    }
    // productDetails.map((e) => myList.add(Container(
    // //  height: 500,
    //   padding: EdgeInsets.all(10),
    //   child: Center(child: Image.network(e.productMedia?.first.url ?? "",fit: BoxFit.fill,height: double.infinity,)),
    // )));
    return myList;
  }
}
